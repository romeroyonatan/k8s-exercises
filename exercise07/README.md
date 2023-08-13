# Ejercicio 7: JobVacancy docker-compose
Para este ejercicio necesitas docker-compose, si estas usando Docker Desktop ya lo tienes instalado, sino deberás instalarlo aparte.Crea un archivo llamado "docker-compose.yml" y pon dentro el contenido de este link: https://gitlab.com/-/snippets/2376003/raw/main/docker-compose.yml.

A continuación ejecuta este comando en una terminal: docker-compose up.
Espera unos minutos hasta que dejen de aparecer mensaje en la terminal. Luego navega localhost:3000 para verificar que la aplicación levantó correctamente.

Finalmente contesta:

¿Cuántos contenedores se están ejecutando? (pueden verlo en el archivo docker-compose.yml y también ejecutando docker ps)
¿Cuales son las imágenes en las que están basados los mencionados contenedores?
¿Puedes leer el docker-compose.yml y describir lo que hace cada una de sus lineas?
Dado que cada contenedor corre en forma aislada ¿Cómo es posible que esos contenedores se vean entre sí?


Escribe tus respuestas ejercicio07/README.md en tu repositorio github y entrega el link directo al archivo.

## Resolución

> ¿Cuántos contenedores se están ejecutando? (pueden verlo en el archivo docker-compose.yml y también ejecutando docker ps)
Se están ejecutando dos contenedores:
1. Base de datos PostgreSQL
2. Applicacion web Ruby
````
$ docker ps

CONTAINER ID   IMAGE                            COMMAND                  CREATED          STATUS         PORTS                    NAMES
f157fbcf3abb   nicopaez/jobvacancy-ruby:1.3.0   "/jobvacancy/start_a…"   49 seconds ago   Up 8 seconds   0.0.0.0:3000->3000/tcp   exercise07-web-1
caf3b60551fb   postgres:14.4-alpine             "docker-entrypoint.s…"   51 seconds ago   Up 8 seconds   5432/tcp                 exercise07-db-1
````

> ¿Cuales son las imágenes en las que están basados los mencionados contenedores?
1. Base de datos: `postgres:14.4-alpine`
2. Aplicación web: `nicopaez/jobvacancy-ruby:1.3.0`

> ¿Puedes leer el docker-compose.yml y describir lo que hace cada una de sus lineas?
```yaml
version: '2'  # especifica versión de la especificación de docker compose. 2 en este caso
services: # declara los servicios de los cuales se compone la aplicación
  web:  # declara un servicio de nombre "web". El nombre puede ser cualquier cosa que sirva para identificar qué hace el contendor
    image: nicopaez/jobvacancy-ruby:1.3.0  # imagen que va a usar el contenedor
    links:  # indica que este contendor se comunica con otros en la misma red. Sin esto es probable que los contenedores no se vean porque están aislados.
      - db  # este contenedor se comunica con otro llamado "db"
    ports:  # declara mapeo de puertos entre el contendor y el host
      - "3000:3000"  # mapea el puerto 3000 del host con el puerto 3000 del contenedor
    environment:  # declara variables de entorno. El significado de cada variable de entorno puede variar de contendor en contenedor
      PORT: "3000"  # puerto en el que escucha la app
      RACK_ENV: "production"  # ambiente en que el la app se está ejecutando
      DATABASE_URL: "postgres://postgres:Passw0rd!@db:5432/postgres"  # configuracion de la base de datos.
    depends_on:  # declara que este contendor se tiene que depende de otros. Se va a ejecutar despues que estos contenedores estén listos
      - db  # depende de la base de datos.
  db:  # servicio de base de datos
    image: postgres:14.4-alpine  # imagen que va a usar este contenedor 
    environment:  # variables de entorno de este contendor
      POSTGRES_PASSWORD: Passw0rd!  # password del usuario default de la base de datos. Solo se usa cuando se crea la base de datos. Si se cambia este valor, no se va a migrar automaticamente.
```

> Dado que cada contenedor corre en forma aislada ¿Cómo es posible que esos contenedores se vean entre sí?
Se pueden ver porque docker compose los ejecuta en una misma red y además el compose declara un link entre ambos contenedores

```sh
$ docker network ls 
NETWORK ID     NAME                 DRIVER    SCOPE
1559b2de0e47   bridge               bridge    local
3f2f737f9321   exercise07_default   bridge    local
daa12fed0160   host                 host      local
d5b1c2a8afaa   none                 null      local`
````
