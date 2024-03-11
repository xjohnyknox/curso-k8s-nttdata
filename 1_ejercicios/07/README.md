# Ejercicios Dia 07.

En este dia, tenemos los siguientes ejercicios:

- [Ejercicios Dia 07.](#ejercicios-dia-07)
  - [1-preparando-el-ambiente](#1-preparando-el-ambiente)
  - [2-backup-etcd](#2-backup-etcd)
  - [3-kubeadm](#3-kubeadm)
  - [4-drain](#4-drain)


## 1-preparando-el-ambiente

Primero vamos a instalar multipass:

Luego vamos a desplegar 1 nodo master:

`multipass launch -c 1 -m 1G -d 4G -n k3s-master 18.04`

Ahora 2 nodos worker así:

`multipass launch -c 1 -m 1G -d 4G -n k3s-worker-1 18.04`

`multipass launch -c 1 -m 1G -d 4G -n k3s-worker-2 18.04`

Listamos para saber que estan las 3 máquinas corriendo:

```
❯  multipass list
Name                    State             IPv4             Image
k3s-master              Running           192.168.65.4     Ubuntu 22.04 LTS
k3s-worker-1            Running           192.168.65.5     Ubuntu 22.04 LTS
k3s-worker-2            Running           192.168.65.6     Ubuntu 22.04 LTS
```

Ahora corremos el binario de k3s en el nodo master:

 `multipass exec k3s-master -- bash -c "curl -sfL https://get.k3s.io | sh -"`

Y vamos a sacar el token de k3s para usarlo en los demás nodos:

`TOKEN=$(multipass exec k3s-master sudo cat /var/lib/rancher/k3s/server/node-token)`

Ahora saquemos la IP del nodo master:

`IP=$(multipass info k3s-master | grep IPv4 | awk '{print $2}')`

Y ahora vamos a hacer join de los workers junto al master:

```
 for f in 1 2; do
     multipass exec k3s-worker-$f -- bash -c "curl -sfL https://get.k3s.io | K3S_URL=\"https://$IP:6443\" K3S_TOKEN=\"$TOKEN\" sh -"
 done
```

Revisemos que si funciona el cluster:

 `multipass exec k3s-master -- bash`

 `sudo kubectl get nodes`

 Y ahora vamos a hacer accesible desde fuera del cluster, por medio de kubectl:

 Dentro del nodo master, ejecutamos:

 `ubuntu@k3s-master:~$ sudo cat /etc/rancher/k3s/k3s.yaml`

```
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: DATA+OMITTED
    server: https://127.0.0.1:6443
  name: default
contexts:
- context:
    cluster: default
    user: default
```

Vamos a copiar y a pegar esa salida, dentro de nuestro `.kube/config`, editando la IP por la del nodo master:

vim `.kube/config`:
   ......
   server: https://192.168.65.4:6443 <----
   ......
:wq

Y probamos desde fuera:

`kubectl get nodes`


## 2-backup-etcd

Por ahora es solo la información.

## 3-kubeadm

Pasos para poder hacer el upgrade de la versión de k8s.

## 4-drain

Vamos a acordonar un nodo:

`kubectl cordon minikube`

Vamos a investigar qué ocurre.

Ahora, quitemosle el cordon:

`kubectl uncordon minikube`

Ahora vamos a drenar un nodo y ver como saca los pods de ese nodo:

`kubectl drain minikube-worker-2 --ignore-daemonsets`

