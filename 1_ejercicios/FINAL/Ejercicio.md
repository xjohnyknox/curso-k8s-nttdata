# Ejercicio Final.

En este dia, tenemos los siguientes ejercicios:

- [Ejercicio Final.](#ejercicio-final)
  - [Creando un Namespace:](#creando-un-namespace)
  - [Creando un pod:](#creando-un-pod)
  - [Creando un replicaset:](#creando-un-replicaset)
  - [Creando un deployment:](#creando-un-deployment)
  - [ServiceAccount:](#serviceaccount)
  - [ClusterRole](#clusterrole)
  - [Affinity Rules:](#affinity-rules)
  - [Documentación:](#documentación)




## Creando un Namespace:

Crea un Namespace llamado `ejercicio-final`

## Creando un pod:

Crea un pod que llamado: `pod-ejercicio-final` que use las labels: `ejercicio:final` y que se ejecute en el namespace `ejercicio-final`

## Creando un replicaset:

Crea un manifiesto para tener un ReplicaSet, que se llame `frontend`
Y que use esta imagen: `us-docker.pkg.dev/google-samples/containers/gke/gb-frontend:v5`
Y que tenga `3 replicas`
Debe correr en el namespace de `ejercicio-final`.


## Creando un deployment:

Crea un deployment con 3 replicas, de la imagen `httpd:2.4.41-alpine`, con el comando sleep 3600.

Que incluya el label: 

`tipo: deployment`

Y que se llame: `mi-deployment`

Que corra en el namespace: `ejercicio-final`.

## ServiceAccount:

Vamos a desplegar una herramienta de monitoreo, pero vamos a darle solo permisos a nivel de serviceaccount.

Crea un **ServiceAccount** llamado "ejercicio-SA" dentro del namespace: `monitoreo`

Ahora debes crear un pod que tenga el despliegue del agente de monitoreo, que use ese serviceaccount.

La imagen es: `datadog/cluster-agent`

Antes de desplegar el pod, debes crear un ClusterRole y ClusterRoleBinging para aplicar ese serviceaccount.

## ClusterRole

Crea un **ClusterRole** llamado "ejercicio-clusterrole" que tenga permisos para listar, crear y borrar pods y servicios en **todos los namespaces**

Aplica el Binding apropiado a ese ClusterRole para el  ejercicio-clusterrole


## Affinity Rules:

Crea 2 deployments asi:

`app-deployment-1 con 1 replica de la imagen nginx:1.24, label: app = deployment1, tier=frontend`
.
`app-deployment-2 con 1 replica de la imagen nginx:1.25, label: app = deployment2, tier=backend`



`Deployment 1` debe tener una regla anti-affinity para asegurarse que no corra en el nodo donde corra el `Deployment 2`.
`Deployment 2` debe tener una regla de afinidad, para asegurarse que corra en el mismo nodo donde corra el `Deployment 1`.

## Documentación:

Puntos adicionales si proporcionas un archivo `PASOS.md` que explique lo que hiciste para lograr cada punto.