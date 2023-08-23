# Ejercicio 12: correr PasswordAPI en Kubernetes
Escribir el descriptor yaml (deployment) para correr la aplicación PasswordAPI (https://hub.docker.com/r/nicopaez/password-api) en Kubernetes (okteto) con 3 replicas.

Agrega un service con auto-ingress

Una vez completo, compartir el link al repositorio (carpeta ejercicio12) con el correspondiente descriptor y las instrucciones que utilizaste y la URL pública para verlo funcionar.

# Resolución
La aplicación se está ejecutando en [https://passwordapi-romeroyonatan.cloud.okteto.net/](https://passwordapi-romeroyonatan.cloud.okteto.net/)

1. Crear los recursos con `kubectl apply -f '*.yml'`  
```sh
$ kubectl apply -f '*.yml'
deployment.apps/passwordapi created
service/passwordapi created
```
2. Los pods pasar a estado `ContainerCreating` mientras se bajan las imágenes  
```sh
$ kubectl get pods
NAME                           READY   STATUS              RESTARTS   AGE
passwordapi-54bdc7b6c5-2hnlj   0/1     ContainerCreating   0          7s
passwordapi-54bdc7b6c5-nxwn6   0/1     ContainerCreating   0          7s
passwordapi-54bdc7b6c5-prpmn   0/1     ContainerCreating   0          7s
```
3. Después de unos segundos los pods están listos para usarse  
```sh
$ kubectl get pods
NAME                           READY   STATUS    RESTARTS   AGE
passwordapi-54bdc7b6c5-2hnlj   1/1     Running   0          91s
passwordapi-54bdc7b6c5-nxwn6   1/1     Running   0          91s
passwordapi-54bdc7b6c5-prpmn   1/1     Running   0          91s
```
