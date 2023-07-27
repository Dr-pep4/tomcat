FROM ubuntu:20.04
LABEL maintainer="Simple Nginx-Tomcat WAS Service"
RUN apt-get update && apt-get install -y openjdk-8-jdk wget
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.75/bin/apache-tomcat-9.0.75.tar.gz -O /tmp/tomcat.tar.gz
RUN tar xvfz /tmp/tomcat.tar.gz
RUN mkdir /usr/local/tomcat
RUN mv /tmp/apache-tomcat-9.0.75/* /usr/local/tomcat/
RUN rm -rf /tmp/apache* /tmp/tomcat.tar.gz
RUN cd /usr/local/tomcat/bin
EXPOSE 8080
