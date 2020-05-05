FROM openjdk:8-jdk-alpine
EXPOSE 8080
RUN apk add --no-cache curl tar bash procps
COPY . .
RUN ./gradlew build
ARG JAR_FILE=build/libs/rest-service-0.0.1-SNAPSHOT.jar
RUN cp ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]

