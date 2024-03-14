#!/bin/bash

# Configuration variables
MASTER_NODE="k3s-master"
WORKER_NODE_PREFIX="k3s-worker"
NODE_COUNT=2
UBUNTU_VERSION="22.04"
CPU="1"
MEMORY="1G"
DISK="4G"

# Function to check if last command succeeded
check_success() {
    if [ $? -ne 0 ]; then
        echo "Error during $1. Exiting..."
        exit 1
    fi
}

# Launch the master node
echo "Launching master node..."
multipass launch -c $CPU -m $MEMORY -d $DISK -n $MASTER_NODE $UBUNTU_VERSION
check_success "master node launch"

# Install K3s on master
echo "Installing K3s on master node..."
multipass exec $MASTER_NODE -- bash -c "curl -sfL https://get.k3s.io | sh -"
check_success "K3s installation on master"

# Retrieve the node-token and IP address from the master node
echo "Retrieving token and IP from master node..."
TOKEN=$(multipass exec $MASTER_NODE -- sudo cat /var/lib/rancher/k3s/server/node-token)
check_success "token retrieval"
IP=$(multipass info $MASTER_NODE | grep IPv4 | awk '{print $2}')
check_success "IP retrieval"

# Launch and configure worker nodes
for (( i=1; i<=NODE_COUNT; i++ )); do
    WORKER_NODE="${WORKER_NODE_PREFIX}-${i}"
    echo "Launching $WORKER_NODE..."
    multipass launch -c $CPU -m $MEMORY -d $DISK -n $WORKER_NODE $UBUNTU_VERSION
    check_success "launch of $WORKER_NODE"
    
    echo "Joining $WORKER_NODE to the cluster..."
    multipass exec $WORKER_NODE -- bash -c "curl -sfL https://get.k3s.io | K3S_URL=\"https://$IP:6443\" K3S_TOKEN=\"$TOKEN\" sh -"
    check_success "joining $WORKER_NODE to cluster"
done

echo "Cluster setup complete."

echo "Saving the kubeconfig information in your local laptop: "
# Fetch the K3s configuration file from the master node
CONFIG=$(multipass exec k3s-master sudo cat /etc/rancher/k3s/k3s.yaml)
# Replace the default server IP in the K3s config with the master node's external IP
CONFIG_MODIFIED=$(echo "$CONFIG" | sed "s/127.0.0.1/$IP/g")

# Backup existing kubeconfig file, if it exists
if [[ -f ~/.kube/config ]]; then
    cp ~/.kube/config ~/.kube/config.backup
    echo "Existing kubeconfig backed up to ~/.kube/config.backup"
fi
# Write the modified K3s config to the local kubeconfig file
# To append instead of overwrite, use ">>" instead of ">"
echo "$CONFIG_MODIFIED" > ~/.kube/config
echo "K3s cluster configuration has been applied to ~/.kube/config"