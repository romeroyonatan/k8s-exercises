# Ejercicio 8: Creación de cluster balanceado
Utilizando docker compose generar una configuración para correr dos instancias de passwordapi (nicopaez/password-api) balanceadas por Nginx.

La aplicación tiene un endpoint /health que indica la ip/host de la instancia que atendió el pedido, se puede usar esto para verificar el correcto balanceo.

Poner la solución en un carpeta ejercicio08, incluyendo la configuración de compose el README.md con la forma correrlo y cualquier explicación que consideres relevante. 

Entregar el link directo a la carpeta en el repositorio.


## Resolución

```sh
docker compose up -d
curl localhost:3000/health
```

### Otra opción: docker compose up --scale
Otra forma de resolver el ejercicio es usando solo un servicio de passwordapi y correr el `docker compose up --scale passwordapi=2` ([documentación](https://docs.docker.com/engine/reference/commandline/compose_up/))

Lo probé pero en los logs no vi que cambie de host. Parece que nginx siempre elije el mismo. Probablemente `nginx` cachea la IP que resuelve `http://passwordapi:3000` y usa siempre la misma en las siguientes peticiones.


## Ejemplo
Docker compose creó 3 contenedores
```sh
$ docker ps
CONTAINER ID   IMAGE                   COMMAND                  CREATED          STATUS         PORTS                  NAMES
8a5c8e2bbe48   nginx                   "/docker-entrypoint.…"   2 minutes ago    Up 2 minutes   0.0.0.0:3000->80/tcp   exercise08-load_balancer-1
b7773abb573b   nicopaez/password-api   "npm start"              11 minutes ago   Up 2 minutes   3000/tcp               exercise08-passwordapi1-1
7717720bc9bb   nicopaez/password-api   "npm start"              11 minutes ago   Up 2 minutes   3000/tcp               exercise08-passwordapi2-1
```

Con `curl` podemos ver el host que atiende cada petición
```sh
$ curl localhost:3000/health
{"host":"b7773abb573b","loadavg":[0.0107421875,0.27587890625,0.40087890625],"freemem":2743971840,"appversion":"1.0.0"}
$ curl localhost:3000/health
{"host":"b7773abb573b","loadavg":[0.009765625,0.27099609375,0.3984375],"freemem":2743971840,"appversion":"1.0.0"}
$ curl localhost:3000/health
{"host":"7717720bc9bb","loadavg":[0.009765625,0.27099609375,0.3984375],"freemem":2742681600,"appversion":"1.0.0"}
$ curl localhost:3000/health
{"host":"b7773abb573b","loadavg":[0.0087890625,0.26611328125,0.39599609375],"freemem":2741649408,"appversion":"1.0.0"}
```

Esto se ve en los logs de docker-compose
```sh
docker compose up
[+] Running 3/3
 ✔ Container exercise08-passwordapi2-1   Created                  0.0s
 ✔ Container exercise08-passwordapi1-1   Created                  0.0s
 ✔ Container exercise08-load_balancer-1  Recreated                0.1s
Attaching to exercise08-load_balancer-1, exercise08-passwordapi1-1, exercise08-passwordapi2-1
exercise08-load_balancer-1  | /docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
exercise08-load_balancer-1  | /docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
exercise08-load_balancer-1  | /docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
exercise08-load_balancer-1  | 10-listen-on-ipv6-by-default.sh: info: can not modify /etc/nginx/conf.d/default.conf (read-only file system?)
exercise08-load_balancer-1  | /docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
exercise08-load_balancer-1  | /docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
exercise08-load_balancer-1  | /docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
exercise08-load_balancer-1  | /docker-entrypoint.sh: Configuration complete; ready for start up
exercise08-load_balancer-1  | 2023/08/13 13:30:19 [notice] 1#1: using the "epoll" event method
exercise08-load_balancer-1  | 2023/08/13 13:30:19 [notice] 1#1: nginx/1.25.1
exercise08-load_balancer-1  | 2023/08/13 13:30:19 [notice] 1#1: built by gcc 12.2.0 (Debian 12.2.0-14)
exercise08-load_balancer-1  | 2023/08/13 13:30:19 [notice] 1#1: OS: Linux 5.15.49-linuxkit-pr
exercise08-load_balancer-1  | 2023/08/13 13:30:19 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
exercise08-load_balancer-1  | 2023/08/13 13:30:19 [notice] 1#1: start worker processes
exercise08-load_balancer-1  | 2023/08/13 13:30:19 [notice] 1#1: start worker process 21
exercise08-load_balancer-1  | 2023/08/13 13:30:19 [notice] 1#1: start worker process 22
exercise08-passwordapi1-1   |
exercise08-passwordapi1-1   | > passwordapi@1.0.0 start /usr/src/app
exercise08-passwordapi1-1   | > node ./lib/server.js
exercise08-passwordapi1-1   |
exercise08-passwordapi1-1   |
exercise08-passwordapi2-1   |
exercise08-passwordapi2-1   | > passwordapi@1.0.0 start /usr/src/app
exercise08-passwordapi2-1   | > node ./lib/server.js
exercise08-passwordapi2-1   |
exercise08-passwordapi2-1   |
exercise08-passwordapi2-1   | App running on port: 3000
exercise08-passwordapi1-1   | App running on port: 3000
exercise08-load_balancer-1  | 172.19.0.1 - - [13/Aug/2023:13:30:33 +0000] "GET /health HTTP/1.1" 200 118 "-" "curl/7.81.0" "-"
exercise08-load_balancer-1  | 172.19.0.1 - - [13/Aug/2023:13:30:38 +0000] "GET /health HTTP/1.1" 200 113 "-" "curl/7.81.0" "-"
exercise08-load_balancer-1  | 172.19.0.1 - - [13/Aug/2023:13:30:40 +0000] "GET /health HTTP/1.1" 200 113 "-" "curl/7.81.0" "-"
exercise08-load_balancer-1  | 172.19.0.1 - - [13/Aug/2023:13:30:42 +0000] "GET /health HTTP/1.1" 200 118 "-" "curl/7.81.0" "-"
```
