# Ejercicio 1: Contenedor nginx
1. Crea una página html que tenga tu nombre
2. Ejecuta una imagen nginx (https://hub.docker.com/_/nginx) para que sirva tu página. Para esto tendrás que utilizar el comando docker run y deberás investigar la documentación de la imagen nginx para descubrir cómo especificarle el contenido que el servidor debe servir.

Ten presente que no hay una única forma de resolver este ejercicio.

Pista: puede que tengas que utilizar docker run con la opción -v

## Solución

```sh
docker run -v "$PWD/index.html:/var/www/index.html" -d -P nginx:1.25.1
```


## Ejemplo

```sh
$ docker run -v "$PWD/index.html:/usr/share/nginx/html/index.html:ro" -d -P nginx:1.25.1-alpine
Trying to pull docker.io/library/nginx:1.25.1-alpine...
Getting image source signatures
...
$ docker ps
CONTAINER ID  IMAGE                                  COMMAND               CREATED        STATUS            PORTS                  NAMES
143016fe7fc6  docker.io/library/nginx:1.25.1-alpine  nginx -g daemon o...  2 seconds ago  Up 3 seconds ago  0.0.0.0:46823->80/tcp  busy_golick
$ curl http://localhost:46823
<html>
<head>
    <title>Yonatan Romero</title>
</head>
<body>
    <h1>Yonatan Romero</h1>
</body>
```
