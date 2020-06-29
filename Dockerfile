# 1. ubuntu 설치 (패키지 업데이트 + 만든사람 표시)
FROM       ubuntu:16.04
MAINTAINER wnsgml972@gmail.com
RUN        apt-get -y update

# 2. Git 설치 및 MPTCP 커널 다운
RUN	apt-get -y install git
RUN	git clone -b mptcp_v0.92 git://github.com/multipath-tcp/mptcp

# 3. 커널 컴파일에 필요한 패키지 설치
RUN	apt-get -y install build-essential libncurses5 libncurses5-dev bin86 kernel-package libssl-dev

# 4. MPTCP 커널 컴파일
# 4.1 git을 통해 받은 디렉토리 이동
WORKDIR	 ./mptcp
# 4.2 기존 커널 config 내용 초기회
RUN	make mrproper
# 4.3 (MPTCP 내용 검색 후 모든 기능 enable 후 .config 파일에 저장)
RUN	make menuconfig
# 4.4 (make 일반적으로 core 개수 * 1.5배)
RUN	make -j 6
RUN	make modules_install
RUN	make install

# 5. 부팅 시 커널 바뀌게 grub 변경
# RUN	echo "savedefault --default=1 --once" | grub --batch
RUN	vi /etc/default/grub
RUN	update-grub
RUN	reboot

# 6. 확인
RUN	dmesg | grep MPTCP


