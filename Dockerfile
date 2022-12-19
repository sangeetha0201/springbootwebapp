FROM openjdk:11

RUN mkdir /apps

COPY ${jar_FILE} /apps/webapps.jar

EXPOSE 8084

CMD ["java", "-jar", "/apps/webapps.jar"]
