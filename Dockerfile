FROM tomcat:9.0-jdk21-temurin

RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/java-web-app.war /usr/local/tomcat/webapps/Java_app.war

EXPOSE 8080

CMD ["catalina.sh", "run"]

