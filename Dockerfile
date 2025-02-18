FROM openjdk:11
VOLUME /tmp
COPY target/demo-1.0.0.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
