FROM adoptopenjdk/openjdk11:jdk-11.0.6_10-alpine-slim
COPY target/demo-0.0.1-SNAPSHOT.jar /demo.jar
WORKDIR /
EXPOSE 8080
CMD ["java", "-jar", "/demo.jar"]
