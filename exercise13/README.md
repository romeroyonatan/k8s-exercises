# Ejercicio 13: JobVacancy en k8s
Escribir todos los descriptores faltantes necesarios para correr en kubernetes la aplicación jobvacancy considerando:

* El descriptor adjunto
* La aplicación requiere de 2 variables: `RACK_ENV: "production"` y `PORT: "3000"`
* La aplicación espera una variable `DATABASE_URL` con url de conexión a la base de datos postgres

**IMPORTANTE:** hay que desplegar un contenedor postgresql (postgres:10.4) no un cluster de postgresql y no se preocupen por utilizar un volumen persistente. Levanten el contenedor y que guarde datos locales, es solo para jugar.

Ubica los descriptores en una carpeta ejercicio13 en tu repositorio personal y entrega el link.

# Resolución
La aplicación se puede acceder a través de [https://jobvacancy-romeroyonatan.cloud.okteto.net/](https://jobvacancy-romeroyonatan.cloud.okteto.net/)

1. Cree el Config Map y el Secret para la aplicación usando los nombres que ya estaban definidos en `web_deployment.yaml`. Para crear los valores secretos tuve que encodear los valores con base64: `echo -n postgresql://postgres:[MASKED]@postgres:5432/postgres | base64 -w0; echo` y lo mismo para la password `echo -n [MASKED] | base64 -w0; echo`
1. Tuve que crear un servicio para la web app y agregar un puerto en el deployment
1. Cree un deployment y un servicio para la base de datos. Decidí usar el mismo secret que la web.
1. Primero creé los recursos con `kubectl apply -f '*.yaml'`  
    ```sh
    $ kubectl apply -f '*.yaml'
    configmap/jobvacancyconfig created
    deployment.apps/jobvacancy-db created
    service/postgres created
    secret/jobvacancysecret created
    deployment.apps/jobvacancy created
    service/jobvacancy created
    ```
1. Después de unos segundos los pods están listos. Filtré el output con `-l app=jobvacancy` para seleccionar sólo los pods de jobvacancy y no los de pingapp que también están corriendo en el mismo namespace  
```sh
$ kubectl get pods -l app=jobvacancy
NAME                             READY   STATUS    RESTARTS   AGE
jobvacancy-77686c75b4-p7hsh      1/1     Running   0          28s
jobvacancy-db-7bb65fb6d9-v2twg   1/1     Running   0          29s
```
