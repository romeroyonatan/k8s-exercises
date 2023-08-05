# Ejercicio 2: Publica una imagen
1. Descarga la imagen nicopaez/pingapp:3.0.0
2. Crear un repositorio en dockerhub
3. Sube la imagen descargada al repositorio creado
4. Crea una carpeta "ejercicio02" en tu repositorio y pon dentro de la misma un archivo README.md con el detalle de instrucciones que utilizaste para completar la tarea.
5. Asegurate que la imagen queda publicada como pública.
6. Incluye al final de las instrucciones la sentencia docker pull exacta para descargar tu imagen.

Pista: utilizar comandos tag, login y push


## Solución

```sh
docker login
docker pull nicopaez/pingapp:3.0.0
docker tag nicopaez/pingapp:3.0.0 romeroyonatan/pingapp:3.0.0
docker push romeroyonatan/pingapp:3.0.0
````


## Ejemplo

```sh
$ docker login
Username: romeroyonatan
Password:
Login Succeeded!
$ docker pull nicopaez/pingapp:3.0.0
Trying to pull docker.io/nicopaez/pingapp:3.0.0...
Getting image source signatures
Copying blob f01ec562c947 done
Copying blob 1915e6344d7f done
Copying blob 2447a2c11907 done
Copying blob f15005b0235f done
Copying blob b998346ba308 done
Copying blob 41ebfd3d2fd0 done
Copying blob c252862c152e done
Copying blob 352f88e533dc done
Copying blob 296ea9472022 done
Copying blob c1390338b41c done
Copying blob 89430077ae85 done
Copying blob 2bafd3ee090a done
Copying config 5021b04106 done
Writing manifest to image destination
Storing signatures
5021b0410677adffd6674b7da4c9d9f62d498af61be816136584cd23d33b0f36
$ docker tag nicopaez/pingapp:3.0.0 romeroyonatan/pingapp:3.0.0
$ docker push romeroyonatan/pingapp:3.0.0
Getting image source signatures
Copying blob 96b6dd776a23 skipped: already exists
Copying blob 185574602537 skipped: already exists
Copying blob 5900cd753a41 skipped: already exists
Copying blob 24efcd549ab5 skipped: already exists
Copying blob 136a15f81f25 skipped: already exists
Copying blob afae6f50abb9 skipped: already exists
Copying blob d69503d78f37 skipped: already exists
Copying blob e3328cdb9fc9 skipped: already exists
Copying blob 7b49ec019b87 skipped: already exists
Copying blob fc09db109f07 skipped: already exists
Copying blob ff5b4dd0fa87 skipped: already exists
Copying blob ba79cea50eb3 skipped: already exists
Copying config 5021b04106 done
Writing manifest to image destination
Storing signatures
```

# Image link
[romeroyonatan/pingapp](https://hub.docker.com/r/romeroyonatan/pingapp)
