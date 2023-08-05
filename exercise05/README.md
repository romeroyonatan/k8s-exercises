# Ejercicio 5: explorando Dockerfile commands
Investigar que hacen y para que se usan los siguientes comandos dentro de un Dockerfile:

* HEALTHCHECK
* ONBUILD
* VOLUME

Escribir la respuesta en el repositorio personal en ejercicio05/README.md, entregar el link director al archivo.

# Solución
* **HEALTHCHECK**: Permite especificar un comando para chequear que un contenedor está saludable. Permite detectar loops infinitos u otras situaciones dónde el contenedor está activo pero no saludable.
* **ONBUILD**: Permite ejecutar comandos mientras se construye otra imagen basada en esa. Los comandos son ejecutados en la instrucción FROM. Si algun comand ONBUILD falla, el FROM falla.
* **VOLUME**: Permite definir volumenes que se van a montar después. Sirve como metadata, ya que naturalmente el punto de montaje depende del host que ejecute el contenedor. Los volumenes declarados pueden ser consultados con `docker inspect`. Se pueden declarar más de un volumen.
