FROM openjdk:8-jdk
LABEL maintainer "Juan Francisco Alvarez Urquijo <paco@technogi.com.mx>"
ARG PORT
ENV PORT ${PORT:-8080}
VOLUME /tmp
EXPOSE $PORT
ENV JAVA_OPTS=""
ADD build/libs/*.jar app.jar
RUN sh -c 'touch /app.jar'
CMD ["sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar"]
