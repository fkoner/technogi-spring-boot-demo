FROM openjdk:8
MAINTAINER Juan Francisco Alvarez Urquijo <fkoner@gmail.com>
ADD spring-boot-demo-0.0.1.jar app.jar
ADD version /version
EXPOSE 8080
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-jar","/app.jar"]
