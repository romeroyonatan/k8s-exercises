# Ejercicio 9: compose v2
Reescribir el descriptor yml de ejercicio 7 de acuerdo a la especificación de compose v2 y contemplando:

- Extraer la password de la base de datos a un secret
- Crear dos networks una exclusivamente "interna" para los servicios db & web y otra exclusivamente para web

Entregar el compose.yaml y demás archivos que consideres necesario en una carpeta ejercicio09.

## Resolución
```sh
tr -dc _A-Z-a-z-0-9 < /dev/urandom | head -c${1:-32} > postgres_password.txt
docker compose up -d
```

### Aclaración: entrypoint.sh
Como la imagen `nicopaez/jobvacancy-ruby:1.3.0` solo recibe la URL conexión de base de datos por variable de entorno tuve que crear un `entrypoint.sh` que lea el archivo y agregue la password a la variable de entorno `DATABASE_URL`.

No necesité modificar la imagen para hacer esto. Pude montar el entrypoint usando `volumes` y cambié el `command` que ejecuta el contenedor.

En un primer momento modifiqué `entrypoint`, pero docker compose me borraba el `command` que por defecto ejecutaba la imagen. Busqué en la documentación y dice literalmente esto:

> Setting entrypoint both overrides any default entrypoint set on the service’s image with the ENTRYPOINT Dockerfile instruction, and clears out any default command on the image - meaning that if there’s a CMD instruction in the Dockerfile, it is ignored.  
> https://docs.docker.com/compose/compose-file/compose-file-v3/#entrypoint

Entonces inspeccioné la imagen para obtener el `command` por defecto y lo volví a declarar en el compose:
```yaml
command: ["/jobvacancy/start_app.sh"]
entrypoint: ["/entrypoint.sh"]
```

Funcionó, pero si el maintainer de la imagen decide cambiar el command por defecto no voy a tener forma de saberlo hasta que algo se rompa. O tengo que prestar atención a ese detalle cada vez que actualize la imagen.

Creo que esto lo debería hacer solo docker compose y no borrar el `command` por defecto.


## Ejemplo

Creamos el archivo `postgres_password.txt` con una password random
```sh
$ tr -dc _A-Z-a-z-0-9 < /dev/urandom | head -c${1:-32} > postgres_password.txt
$ cat postgres_password.txt;echo
9yUH9zhn5bez8VPxBIAbEE-U5mcX_EZN
```

Iniciamos la aplicación
```sh
$ docker compose up -d
[+] Running 4/4
✔ Network exercise09_public   Created  0.1s 
✔ Network exercise09_private  Created  0.0s 
✔ Container exercise09-db-1   Started  0.4s 
✔ Container exercise09-web-1  Started  0.8s 
```

Docker compose creó las 2 redes
```sh
$ docker network ls
NETWORK ID     NAME                 DRIVER    SCOPE
1559b2de0e47   bridge               bridge    local
d0ae73ab888a   exercise09_private   bridge    local
65552a0d3834   exercise09_public    bridge    local
daa12fed0160   host                 host      local
d5b1c2a8afaa   none                 null      local
```

La password está en `/run/secrets/postgres_password`
```sh
$ docker compose exec web cat /run/secrets/postgres_password
9yUH9zhn5bez8VPxBIAbEE-U5mcX_EZN
````
