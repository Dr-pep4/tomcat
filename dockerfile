FROM ubuntu:20.04
LABEL maintainer="Simple Nginx-Tomcat WAS Service"
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y wget
RUN wget tzdata
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.75/bin/apache-tomcat-9.0.75.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp
RUN tar xvfz tomcat.tar.gz
RUN mkdir /usr/local/tomcat
RUN mv /tmp/apache-tomcat-9.0.75/'*' /usr/local/tomcat/
RUN rm -rf /tmp/apache* /tmp/tomcat.tar.gz
COPY index.jsp /usr/local/tomcat/webapps/ROOT/
COPY context.xml /usr/local/tomcat/conf/
COPY mysql-connector-j-8.0.32.jar /usr/local/tomcat/lib/
RUN cd /usr/local/tomcat/bin
RUN ./startup.sh
ENV TZ=Asia/Seoul
EXPOSE 8080
