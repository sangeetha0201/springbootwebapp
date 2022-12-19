FROM openjdk:11

RUN mkdir /apps

COPY  --from=build ~/ProgramData/Jenkins/.jenkins/workspace/springbootwebapp-pipeline1/target/*.jar /apps/webapps.jar

EXPOSE 8084

CMD ["java", "-jar", "/apps/webapps.jar"]
