FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD eureka-server.jar app.jar
EXPOSE 8761
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]