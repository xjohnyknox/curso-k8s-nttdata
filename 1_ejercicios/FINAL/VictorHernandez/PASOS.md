PASOS.md


# Creando un Namespace:
Este ejercicio ha sido resuelto aplicando el siguiente procedimiento:

    - En primer lugar con el comando `kubectl create namespace victor --dry-run=client -o yaml` obtienes el yaml para su revisión.
    - En segundo lugar aplicas el fichero con `kubectl create -f final-namespace.yml` con su correspondiente validación.

# Creando un Pod:
Este ejercicio ha sido resuelto aplicando el siguiente procedimiento:

    - En primer lugar con el comando `kubectl run victor-pod --image=busybox --labels=ejercicio=final --port=80 --namespace victor --dry-run=client -o yaml` obtienes el yaml para su revisión.
    - En segundo lugar aplicas el fichero con `kubectl create -f final-por.yml` con su correspondiente validación.

# Creando un ReplicaSet:

    - En este ejercicio se ha aplicado directamente el ReplicaSet obteniendo un ejemplo de la documentación oficial de Kubernetes [Aqui](https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/#example) aplicando la configuración necesaria del ejercicio.

# Creando un Deployment:

Este ejercicio ha sido resuelto de la siguiente forma:

    - En primer lugar obteniendo el yaml con el siguiente comando ´kubectl create deployment mi-deployment --image=nginx --dry-run=client -n victor -o yaml -- sleep 3600´.
    - En segundo lugar se ha modificado el manifiesto de forma manual para añadir la label aunque también se puede ejecutar el siguiente comando ´kubectl label deployment mi-deployment tipo=deployment´.
    

# Crea un ServiceAccount:

En este ejercicio se ha aplicado los recursos en el mismo fichero yaml aprovechando esta característica aunque se podría haber utilizado Kustomization también pero por simplificar.

    - En primer lugar se crea el namespace necesario puesto que no existe con el siguiente comando ´kubectl create namespace ejercicio-final -o yaml --dry-run=client´ se obtiene el yaml.
    - En segundo lugar se crea la serviceAccount necesaria con el nombre **ejercicio-sa puesto que ejercicio-SA da une error por los carácteres en mayúsculas** con el comando ´kubectl create sa ejercicio-sa -n ejercicio-final -o yaml --dry-run=client´ y se obtiene el yaml.
    - En tercer lugar se aplica el yaml con ´kubectl create -f final-serviceaccount.yml´ y su correspondiente validación.

# Crea un ClusterRole:

Este ejercicio se ha aplicado de la forma similar que el anterior sin utilizar Kustomization y se ha acudido a la documentación oficial [Aqui](https://kubernetes.io/docs/reference/access-authn-authz/rbac/#clusterrole-example) donde explica el manifiesto y se ha modificado de forma manual las acciones sobre las que se quiere aplicar y los recursos afectados.

Al ser un ClusterRole se ha aplicado un ClusterRoleBinding para que afecte a nivel de cluster a todos los namespaces consultando también la documentación oficial [Aqui](https://kubernetes.io/docs/reference/access-authn-authz/rbac/#clusterrolebinding-example) y modificando el manifiesto añadiendo la correspondiente ServiceAccount creada en el anterior ejercicio.

# AffinityRules:

Este ejercicio se ha resuelto de la forma similar que el anterior, sin utilizar Kustomization y se ha acudido a la documentación oficial [Aqui](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#an-example-of-a-pod-that-uses-pod-affinity) para aplicar de la misma manera que solicitaba el ejercicio con los correspondientes operadores y añadiendo las labels correctas para que afecte.

