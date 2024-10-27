# Use official Tomcat image as a base
FROM tomcat:9.0

# Copy the WAR file to Tomcat's webapps directory
COPY target/Website-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/Website-1.0-SNAPSHOT.war

# Expose the Tomcat port (8080 by default)
EXPOSE 8080
