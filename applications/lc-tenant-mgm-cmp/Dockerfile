FROM docker.io/library/eclipse-temurin:17-jdk

WORKDIR /app

COPY /lc-tenant-mgm-cmp-server/build/libs/*.jar /app/lc-tenant-mgm-cmp-server.jar

CMD ["java","-jar","/app/lc-tenant-mgm-cmp-server.jar"]
