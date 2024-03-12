# Pre Requisitos.

Como tenemos una restricción por el lado de AWS, vamos a asumir que el lab se hace en tu ordenador, para ello, debemos tener Virtualbox y Multipass (aunque docker desktop podría servir inicialmente, el manejode clusters es más fácil con estos dos).


## 1. Instalando Virtualbox.

Para el hipervisor, vamos a usar Virtualbox, y como de seguro tienes un ordenador con Windows, aquí lo puedes instalar:

[Para Windows](https://download.virtualbox.org/virtualbox/7.0.14/VirtualBox-7.0.14-161095-Win.exe)

Cuando lo instale yo, me salía este error:

![error virtualbox](image-3.png)
![error virtualbox 2](image-4.png)

Si te sale, debes instalar este paquete de Visual Studio C++:
[Libreria Visual Studio](https://aka.ms/vs/17/release/vc_redist.x64.exe)
![Libreria 1](image-5.png)
![Libreria 2](image-6.png)
![Libreria 3](image-7.png)

Y ahora si podemos instalar el virtualbox:

![alt text](image-8.png)
![alt text](image-9.png)
![alt text](image-10.png)
![alt text](image-11.png)
![alt text](image-12.png)
![alt text](image-13.png)
![alt text](image-14.png)

Y listo, ya tenemos instalado el virtualbox:

![alt text](image-15.png)

## 2. Instalando MultiPass.

Ahora vamos a descargar el multipass para windows: [Descargar aquí](https://multipass.run/download/windows)

![alt text](image-16.png)
![alt text](image-17.png)
![alt text](image-18.png)

Al momento de esta ventana, debemos seleccionar: **Oracle VM Virtualbox**:
![alt text](image-19.png)

![alt text](image-20.png)
![alt text](image-21.png)
![alt text](image-22.png)

Y si abres el panel de aplicaciones instaladas en windows, veras los dos componentes ya en el sistema:

![alt text](image-23.png)

## 3. Instalando docker (OPCIONAL).

Para los ejercicios introductorios, vamos a ver como funcionan los contenedores, por ende se pone opcional el uso de docker desktop.

![Alt text](image-2.png)

Y comprobando que funcione:

`docker run --rm alpine echo "Hola mundo"`

## 4. Usando Docker Compose (OPCIONAL).

`docker-compose up -d`

<!-- ## 3. Instalando MiniKube

Primero vamos a descargar e instalar el binario según sea nuestra plataforma:[MacOS, Linux, Windows](https://minikube.sigs.k8s.io/docs/start/)

![Instalando minikube](image.png)

Luego de esto vamos a iniciar minikube:

`minikube start`

Y vamos a instalar kubectl: 

`minikube kubectl -- get po -A`

Si el comando anterior no funciona, debes instalarlo manualmente: 

[Click aquí](https://kubernetes.io/docs/tasks/tools/#kubectl)

Y si todo salio bien, vamos a comprobar:

```
kubectl config current-context 
minikube
```

Podemos ir a `minikube dashboard` para ver la interfaz gráfica que honestamente, nadie usa:

![Alt text](image-1.png) -->