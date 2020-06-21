FROM maven:3.6.0-jdk-11-slim AS build
COPY src /Users/dharanianimireddy/demodocker/src
COPY pom.xml /Users/dharanianimireddy/demodocker
RUN mvn -f /Users/dharanianimireddy/demodocker/pom.xml clean package

FROM openjdk:8-jdk-alpine
COPY --from=build /Users/dharanianimireddy/demodocker/target/gs-spring-boot-docker-0.1.0.jar /usr/local/lib/demodockeraks.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/demodockeraks.jar"]
