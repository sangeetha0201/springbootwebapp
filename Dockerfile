FROM openjdk:11

RUN mkdir /apps

COPY target/*.jar /apps/webapps.jar

EXPOSE 8080

CMD ["java", "-jar", "/apps/webapps.jar"]
