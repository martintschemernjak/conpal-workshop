FROM gradle:jdk17 AS build
WORKDIR /home/root/build/

COPY . .

RUN gradle clean build

## Stage 2 where Docker is running a java process to run a service built in previous stages.
FROM eclipse-temurin:17-jdk

ENV SPRING_PROFILES_ACTIVE=dev

WORKDIR /home/root/ws-spring-backend/

COPY --from=build /home/root/build/build/libs/ws-spring-backend-0.0.1-SNAPSHOT.jar /home/root/ws-spring-backend/ws-spring-backend.jar

EXPOSE 8080
EXPOSE 18080
ENTRYPOINT ["java", "-jar","/home/root/ws-spring-backend/ws-spring-backend.jar"]