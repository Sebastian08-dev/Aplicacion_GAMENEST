FROM tomcat:9.0-jdk17-temurin
WORKDIR /usr/local/tomcat/webapps/

# Ajusta "dist/mi-proyecto.war" a la ruta real de tu archivo local
COPY dist/ProyectoWebIntegrado.war ./ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]