# Ejercicio 10: CMD vs ENTRYPOINT

Investigar y explicar con tus propias palabras las diferencias de las instrucciones CMD y ENTRYPOINT.

Escribir la respuesta en tu repositorio personal en ejercicio10/README.md, entregar el link director al archivo.

# Resolución
`CMD` y `ENTRYPOINT` permiten hacer cosas parecidas en al ejecutar el contenedor. Definen el comando que se va a ejecutar cuando se ejecute el `docker run`. Sin embargo la semántica entre estos dos comandos es distinta:

`ENTRYPOINT` permite ejecutar el contenedor como un ejecutable y pasarle parámetros a través de `CMD` o `docker run`

Por ejemplo `docker run --rm -it jpillora/chisel --help` va a mostrar la ayuda de un servidor SOCKS

Cualquier parámetro que le pasemos a `docker run` va a sobreescribir el valor de `CMD`

`CMD` por su parte permite definir los argumentos por defecto de `ENTRYPOINT` o en su defecto, el comando por defecto que va a ejecutar el contenedor.
