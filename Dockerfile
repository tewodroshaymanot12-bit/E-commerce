FROM tomcat:9.0

COPY dist/SmartElectronics.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080