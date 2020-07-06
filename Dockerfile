# 1. ubuntu 설치 (패키지 업데이트 + 만든사람 표시)
FROM       ubuntu:16.04
MAINTAINER wnsgml972@gmail.com
RUN        apt-get -y update

# 2. 이것저것 설치
RUN	apt-get -y install git build-essential libncurses5 libncurses5-dev bin86 kernel-package libssl-dev



