# 공식 Ubuntu 기본 이미지를 사용합니다
FROM ubuntu:latest

# 환경 변수를 설정합니다
ENV TOMCAT_VERSION=8.5.91 \
    CATALINA_HOME=/opt/tomcat


# wget과 Java를 설치합니다
RUN apt-get update && \
    apt-get install -y wget openjdk-11-jre-headless && \
    rm -rf /var/lib/apt/lists/*

# Tomcat을 다운로드하고 설치합니다
RUN mkdir -p ${CATALINA_HOME} && \
    wget -O /tmp/apache-tomcat.tar.gz https://dlcdn.apache.org/tomcat/tomcat-8/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    tar -xzvf /tmp/apache-tomcat.tar.gz -C ${CATALINA_HOME} --strip-components=1 && \
    rm /tmp/apache-tomcat.tar.gz
COPY server.xml /opt/tomcat/conf/

# 기본 Tomcat 포트를 노출합니다
EXPOSE 8081

# 작업 디렉토리를 Tomcat의 bin 디렉토리로 설정합니다
WORKDIR ${CATALINA_HOME}/bin

# Tomcat을 실행합니다
CMD ["./catalina.sh", "run"]

