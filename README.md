# Curso de Kubernetes - NTT Data

¡Bienvenidos al Curso de Kubernetes - NTT Data! 
Este curso está diseñado para proporcionar a los alumnos una introducción completa y práctica al mundo de Kubernetes utilizando AWS EKS como plataforma de aprendizaje.

## Sobre mi.

Mi nombre es Johny Jimenez, actualmente trabajo como ingeniero DevOps para [Sonatype](https://www.sonatype.com/).

Tengo ya 13 años de estar trabajando en TI.

De los cuales me dedique a dar soporte, fui arquitecto de soluciones, ingeniero preventa, instructor de cursos de ciberseguridad, freelance, y desde el 2021 estoy 100% dedicado a temas de DevOps y SRE.

Es mi segundo curso con el Grupo Loyal.

Me apasiona linux y el open source, también tengo algunas certificaciones (LFCA, RHCS, CKA) y la más reciente la de AWS Cloud Practitioner.

## Descripción

En este curso de 5 días, exploraremos los fundamentos de Kubernetes, y cómo gestionar clústeres de Kubernetes en entornos de desarrollo y prueba. A lo largo del curso, obtendrás experiencia práctica mediante ejercicios.

## Temario

### Introducción a Kubernetes y Minikube
- Presentación del curso
- Del monolito al microservicio
- Repaso sobre contenedores
- Qué es Kubernetes y por qué es importante
- Instalación y configuración de Minikube
- Creación del primer clúster con Minikube

### Pods y Contenedores
- Concepto de Pods
- Creación y gestión de contenedores
- Despliegue de aplicaciones en Pods (Deployment, Replicasets, Daemonsets)

### Servicios y Balanceo de Carga
- Servicios en Kubernetes
- Balanceo de carga en Kubernetes
- Prácticas con servicios

### Almacenamiento y Persistencia
- Almacenamiento en Docker y en Kubernetes
- Volúmenes y persistencia de datos
- Configuración de almacenamiento persistente

### Configurando pods avanzados, node affinity, taints y tolerations.
- Comandos y argumentos en un pod
- Variables de ambiente
- ConfigMaps
- Configuración con ConfigMaps y Secrets


### Configuración y Gestión de Recursos
- Configuración de recursos de CPU y memoria
- Limitación y solicitud de recursos
- Monitoreo de recursos (Metrics Server)
- Node Affinity
- Taints, Tolerations

### Mantenimiento del cluster
- Actualizando kubernetes
- Haciendo backup a ETCD

### Seguridad, Diseño de Cluster
- RBAC (ClusterRoles, SA, Certs)
- Network Policy
- Diseño del cluster
- Despliegue continuo (CI/CD) con Kubernetes

## Archivos en este Repositorio

- `ejercicios/`: Contiene ejercicios prácticos y proyectos relacionados con el curso.
- `recursos/`: Archivos adicionales y recursos útiles para el curso.

## Requisitos Previos

- Conocimiento básico de contenedores y Docker.
- Tener instalado docker en tu ordenador.


## Configuración en tu ordenador AWS-CLI (opcional)

La idea es que tengas ya descargado el **aws-cli**, si no lo tienes [aquí](https://docs.aws.amazon.com/es_es/cli/latest/userguide/getting-started-install.html#getting-started-install-instructions) un enlace con más información.

Adicional, vas a tener tus propios keys, para guardarlos en tu terminal.


## Contribuciones

Si deseas contribuir a este curso o informar sobre errores, no dudes en abrir un Issue o enviar un Pull Request. ¡Estamos abiertos a tus sugerencias!

¡Esperamos que disfrutes de tu viaje a través de Kubernetes!