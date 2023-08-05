# Ejercicio 4: creación de imagen PasswordAPI
Adjunto hay un archivo .jar que tiene la aplicación PasswordApi.
Esa aplicación es una aplicación Java que se ejecuta con el comando: java -jar passwordapi.jar. Eso levanta una webapi en el puerto 8080 (ver captura de pantalla).
Lo que se pide es generar una imagen Docker que corra esa aplicación. Más concretamente lo que hay que hacer es:
1. Escribir un dockerfile
2. Generar la imagen a partir del dockerfile ejecutando un docker build
3. Publicar la imagen en Dockerhub

Resolver el ejercicio en un directorio "ejercicio04" del repositorio personal.
Mencionar en el readme el link a la imagen publicada en dockerhub
Entregar el link a la carpeta del repositorio github.

# Solución
```sh
docker build . -t romeroyonatan/passwordapi:0.1.0
docker run -P romeroyonatan/passwordapi:0.1.0
docker push romeroyonatan/passwordapi:0.1.0
```

# Ejemplo


```sh
$ docker build . -t romeroyonatan/passwordapi:0.1.0
STEP 1/6: FROM openjdk:11-ea-9-jre-slim
STEP 2/6: WORKDIR /app
--> Using cache 86d6d2a6fe69aca69d40a2063f93faf06236b234957fe091b11438e03aad7b52
--> 86d6d2a6fe6
STEP 3/6: ADD passwordapi.jar .
--> Using cache ce9645415acdd7016eafaa21637cecbd9d8ad94dad9114adf048e9e29d99f2e7
--> ce9645415ac
STEP 4/6: USER 65534
--> c3dd42217e0
STEP 5/6: EXPOSE 8080/tcp
--> 75e2253c384
STEP 6/6: CMD ["java", "-jar", "passwordapi.jar"]
COMMIT romeroyonatan/passwordapi:0.1.0
--> fc8bec2dc90
Successfully tagged localhost/romeroyonatan/passwordapi:0.1.0
fc8bec2dc90a6bb8b4db4bb544587f2f743e2821186b324cb9bf295db88288fa
$ docker run --rm -P  romeroyonatan/passwordapi:0.1.0
  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::        (v2.0.3.RELEASE)

2023-08-04 16:53:50.476  INFO 1 --- [           main] com.nicopaez.passwordapi.Application     : Starting Application v1.5.0 on 62436b9e0e45 with PID 1 (/app/passwordapi.jar started by root in /app)
2023-08-04 16:53:50.482  INFO 1 --- [           main] com.nicopaez.passwordapi.Application     : No active profile set, falling back to default profiles: default
2023-08-04 16:53:50.589  INFO 1 --- [           main] ConfigServletWebServerApplicationContext : Refreshing org.springframework.boot.web.servlet.context.AnnotationConfigServletWebServerApplicationContext@3427b02d: startup date [Fri Aug 04 16:53:50 UTC 2023]; root of context hierarchy
WARNING: An illegal reflective access operation has occurred
WARNING: Illegal reflective access by org.springframework.cglib.core.ReflectUtils$1 (jar:file:/app/passwordapi.jar!/BOOT-INF/lib/spring-core-5.0.7.RELEASE.jar!/) to method java.lang.ClassLoader.defineClass(java.lang.String,byte[],int,int,java.security.ProtectionDomain)
WARNING: Please consider reporting this to the maintainers of org.springframework.cglib.core.ReflectUtils$1
WARNING: Use --illegal-access=warn to enable warnings of further illegal reflective access operations
WARNING: All illegal access operations will be denied in a future release
2023-08-04 16:53:52.569  INFO 1 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port(s): 8080 (http)
2023-08-04 16:53:52.605  INFO 1 --- [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
2023-08-04 16:53:52.606  INFO 1 --- [           main] org.apache.catalina.core.StandardEngine  : Starting Servlet Engine: Apache Tomcat/8.5.31
2023-08-04 16:53:52.620  INFO 1 --- [ost-startStop-1] o.a.catalina.core.AprLifecycleListener   : The APR based Apache Tomcat Native library which allows optimal performance in production environments was not found on the java.library.path: [/usr/java/packages/lib:/usr/lib/x86_64-linux-gnu/jni:/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu:/usr/lib/jni:/lib:/usr/lib]
2023-08-04 16:53:52.714  INFO 1 --- [ost-startStop-1] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
2023-08-04 16:53:52.714  INFO 1 --- [ost-startStop-1] o.s.web.context.ContextLoader            : Root WebApplicationContext: initialization completed in 2134 ms
2023-08-04 16:53:53.401  INFO 1 --- [ost-startStop-1] o.s.b.w.servlet.ServletRegistrationBean  : Servlet dispatcherServlet mapped to [/]
2023-08-04 16:53:53.407  INFO 1 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'characterEncodingFilter' to: [/*]
2023-08-04 16:53:53.408  INFO 1 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'hiddenHttpMethodFilter' to: [/*]
2023-08-04 16:53:53.408  INFO 1 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'httpPutFormContentFilter' to: [/*]
2023-08-04 16:53:53.408  INFO 1 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'requestContextFilter' to: [/*]
2023-08-04 16:53:53.408  INFO 1 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'httpTraceFilter' to: [/*]
2023-08-04 16:53:53.408  INFO 1 --- [ost-startStop-1] o.s.b.w.servlet.FilterRegistrationBean   : Mapping filter: 'webMvcMetricsFilter' to: [/*]
2023-08-04 16:53:53.854  INFO 1 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/check-match],methods=[GET]}" onto public java.util.Map<java.lang.String, java.lang.Object> com.nicopaez.passwordapi.PasswordController.checkMatch(java.lang.String,java.lang.String)
2023-08-04 16:53:53.855  INFO 1 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/password],methods=[GET]}" onto public java.util.Map<java.lang.String, java.lang.Object> com.nicopaez.passwordapi.PasswordController.password()
2023-08-04 16:53:53.855  INFO 1 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/],methods=[GET]}" onto public org.springframework.web.servlet.view.RedirectView com.nicopaez.passwordapi.PasswordController.index()
2023-08-04 16:53:53.855  INFO 1 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/hash],methods=[GET]}" onto public java.util.Map<java.lang.String, java.lang.Object> com.nicopaez.passwordapi.PasswordController.hash(java.lang.String)
2023-08-04 16:53:53.855  INFO 1 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/valid],methods=[GET]}" onto public java.util.Map<java.lang.String, java.lang.Object> com.nicopaez.passwordapi.PasswordController.valid(java.lang.String)
2023-08-04 16:53:53.860  INFO 1 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/swagger-resources/configuration/ui]}" onto public org.springframework.http.ResponseEntity<springfox.documentation.swagger.web.UiConfiguration> springfox.documentation.swagger.web.ApiResourceController.uiConfiguration()
2023-08-04 16:53:53.861  INFO 1 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/swagger-resources/configuration/security]}" onto public org.springframework.http.ResponseEntity<springfox.documentation.swagger.web.SecurityConfiguration> springfox.documentation.swagger.web.ApiResourceController.securityConfiguration()
2023-08-04 16:53:53.862  INFO 1 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/swagger-resources]}" onto public org.springframework.http.ResponseEntity<java.util.List<springfox.documentation.swagger.web.SwaggerResource>> springfox.documentation.swagger.web.ApiResourceController.swaggerResources()
2023-08-04 16:53:53.868  INFO 1 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/error],produces=[text/html]}" onto public org.springframework.web.servlet.ModelAndView org.springframework.boot.autoconfigure.web.servlet.error.BasicErrorController.errorHtml(javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse)
2023-08-04 16:53:53.868  INFO 1 --- [           main] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped "{[/error]}" onto public org.springframework.http.ResponseEntity<java.util.Map<java.lang.String, java.lang.Object>> org.springframework.boot.autoconfigure.web.servlet.error.BasicErrorController.error(javax.servlet.http.HttpServletRequest)
2023-08-04 16:53:53.954  INFO 1 --- [           main] o.s.b.a.e.web.EndpointLinksResolver      : Exposing 2 endpoint(s) beneath base path '/actuator'
2023-08-04 16:53:53.966  INFO 1 --- [           main] s.b.a.e.w.s.WebMvcEndpointHandlerMapping : Mapped "{[/actuator/health],methods=[GET],produces=[application/vnd.spring-boot.actuator.v2+json || application/json]}" onto public java.lang.Object org.springframework.boot.actuate.endpoint.web.servlet.AbstractWebMvcEndpointHandlerMapping$OperationHandler.handle(javax.servlet.http.HttpServletRequest,java.util.Map<java.lang.String, java.lang.String>)
2023-08-04 16:53:53.967  INFO 1 --- [           main] s.b.a.e.w.s.WebMvcEndpointHandlerMapping : Mapped "{[/actuator/info],methods=[GET],produces=[application/vnd.spring-boot.actuator.v2+json || application/json]}" onto public java.lang.Object org.springframework.boot.actuate.endpoint.web.servlet.AbstractWebMvcEndpointHandlerMapping$OperationHandler.handle(javax.servlet.http.HttpServletRequest,java.util.Map<java.lang.String, java.lang.String>)
2023-08-04 16:53:53.968  INFO 1 --- [           main] s.b.a.e.w.s.WebMvcEndpointHandlerMapping : Mapped "{[/actuator],methods=[GET],produces=[application/vnd.spring-boot.actuator.v2+json || application/json]}" onto protected java.util.Map<java.lang.String, java.util.Map<java.lang.String, org.springframework.boot.actuate.endpoint.web.Link>> org.springframework.boot.actuate.endpoint.web.servlet.WebMvcEndpointHandlerMapping.links(javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse)
2023-08-04 16:53:54.118  INFO 1 --- [           main] pertySourcedRequestMappingHandlerMapping : Mapped URL path [/v2/api-docs] onto method [public org.springframework.http.ResponseEntity<springfox.documentation.spring.web.json.Json> springfox.documentation.swagger2.web.Swagger2Controller.getDocumentation(java.lang.String,javax.servlet.http.HttpServletRequest)]
2023-08-04 16:53:54.249  INFO 1 --- [           main] o.s.w.s.handler.SimpleUrlHandlerMapping  : Mapped URL path [/**/favicon.ico] onto handler of type [class org.springframework.web.servlet.resource.ResourceHttpRequestHandler]
2023-08-04 16:53:54.398  INFO 1 --- [           main] s.w.s.m.m.a.RequestMappingHandlerAdapter : Looking for @ControllerAdvice: org.springframework.boot.web.servlet.context.AnnotationConfigServletWebServerApplicationContext@3427b02d: startup date [Fri Aug 04 16:53:50 UTC 2023]; root of context hierarchy
2023-08-04 16:53:54.449  INFO 1 --- [           main] o.s.w.s.handler.SimpleUrlHandlerMapping  : Mapped URL path [/webjars/**] onto handler of type [class org.springframework.web.servlet.resource.ResourceHttpRequestHandler]
2023-08-04 16:53:54.449  INFO 1 --- [           main] o.s.w.s.handler.SimpleUrlHandlerMapping  : Mapped URL path [/**] onto handler of type [class org.springframework.web.servlet.resource.ResourceHttpRequestHandler]
2023-08-04 16:53:54.747  INFO 1 --- [           main] o.s.j.e.a.AnnotationMBeanExporter        : Registering beans for JMX exposure on startup
2023-08-04 16:53:54.758  INFO 1 --- [           main] o.s.c.support.DefaultLifecycleProcessor  : Starting beans in phase 2147483647
2023-08-04 16:53:54.758  INFO 1 --- [           main] d.s.w.p.DocumentationPluginsBootstrapper : Context refreshed
2023-08-04 16:53:54.781  INFO 1 --- [           main] d.s.w.p.DocumentationPluginsBootstrapper : Found 1 custom documentation plugin(s)
2023-08-04 16:53:54.824  INFO 1 --- [           main] s.d.s.w.s.ApiListingReferenceScanner     : Scanning for api listing references
2023-08-04 16:53:54.974  INFO 1 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port(s): 8080 (http) with context path ''
2023-08-04 16:53:54.980  INFO 1 --- [           main] com.nicopaez.passwordapi.Application     : Started Application in 5.101 seconds (JVM running for 5.721)
Password API is now running
^C
$ docker push romeroyonatan/passwordapi:0.1.0
Getting image source signatures
Copying blob bc3d70fa9622 done  
Copying blob 6bceb3e7ffa5 skipped: already exists  
Copying blob a4cd7c9e0aeb skipped: already exists  
Copying blob 455055797990 skipped: already exists  
Copying blob 5d4a7942690f skipped: already exists  
Copying blob b6344cfabd66 skipped: already exists  
Copying config fc8bec2dc9 done  
Writing manifest to image destination
Storing signatures
```

# Link to image
[romeroyonatan/passwordapi](https://hub.docker.com/r/romeroyonatan/passwordapi)
