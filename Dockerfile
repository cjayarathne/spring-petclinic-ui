FROM java:7

# Install maven
RUN apt-get update
RUN apt-get install -y wget git-core maven

WORKDIR /spring-petclinic-ui

# Pull project
RUN git clone https://github.com/cjayarathne/spring-petclinic-ui.git

# Prepare by downloading dependencies
COPY src /spring-petclinic-ui/src
COPY src /spring-petclinic-ui/assets
COPY pom.xml /spring-petclinic-ui/pom.xml

EXPOSE 8000
CMD ["mvn", "tomcat7:run"]