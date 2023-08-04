FROM openjdk:11-ea-9-jre-slim
WORKDIR /app
ADD passwordapi.jar .
USER 65534
EXPOSE 8080/tcp
CMD ["java", "-jar", "passwordapi.jar"]
