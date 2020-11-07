#1. ubuntu 설치 (패키지 업데이트 + 만든사람 표시)
FROM        ubuntu:16.04
LABEL       maintainer="wnsgml972@gmail.com"
RUN         apt-get -y update
RUN	        apt-get -y install build-essential ftpd ssh iperf speedometer git vim net-tools strongswan

# 2. tomcat 설치
RUN	        apt-get -y install openjdk-8-jre-headless openjdk-8-jdk
WORKDIR	    /home/
RUN	        git clone -b 8.5.x https://github.com/MPSec/tomcat.git
RUN		mv tomcat tomcat8

# 3. Host Container의 Web Application 복사 후 Tomcat에 배포
COPY	    . /usr/src/app/
WORKDIR	    /home/tomcat8/webapps/ROOT/
RUN         rm -rf *
WORKDIR	    /home/tomcat8/webapps/ROOT/MPSec/
WORKDIR	    /usr/src/app/
RUN	        cp -r * /home/tomcat8/webapps/ROOT/MPSec/.
WORKDIR	    /home/tomcat8/webapps/ROOT/MPSec/
RUN	        mv index.html ../index.html
WORKDIR	    /home/tomcat8/webapps/ROOT/MPSec/assets/
RUN	        mv welcome.jpg ../../welcome.jpg
RUN		mkdir /home/tomcat8/logs

# 4. MPSec 각종 설정을 포함한 서버 실행 (Listen 포트 정의 : Tomcat의 Listen Port는 8080)
EXPOSE	    8080
ADD         ./bin /usr/local/bin
RUN         chmod 777 /usr/local/bin/*
RUN         chmod 777 /home/tomcat8/bin/*
ENTRYPOINT  ["/bin/bash", "start-mpsec.sh"]

