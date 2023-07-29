# Use the official Ubuntu base image
FROM ubuntu:20.04

# Set environment variables
ENV TOMCAT_VERSION=10.0.12 \
    CATALINA_HOME=/opt/tomcat

# Install Java and other dependencies
RUN apt-get update && \
    apt-get install -y openjdk-11-jre-headless curl && \
    rm -rf /var/lib/apt/lists/*

# Download and install Tomcat
RUN mkdir -p ${CATALINA_HOME} && \
    curl -SL "https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz" | tar -xzC ${CATALINA_HOME} --strip-components=1

# Expose the default Tomcat port
EXPOSE 8080

# Set the working directory to Tomcat's bin directory
WORKDIR ${CATALINA_HOME}/bin

# Start Tomcat
CMD ["./catalina.sh", "run"]
