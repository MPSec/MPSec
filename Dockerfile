# 1. ubuntu 설치 (패키지 업데이트 + 만든사람 표시)
FROM        ubuntu:16.04
LABEL       maintainer="wnsgml972@gmail.com"
RUN         apt-get -y update
RUN	        apt-get -y install build-essential ftpd ssh iperf speedometer git vim net-tools strongswan

# 2. tomcat 설치
RUN	        apt-get -y openjdk-8-jre-headless openjdk-8-jdk
WORKDIR	    /home/
RUN	        wget http://apache.tt.co.kr/tomcat/tomcat-8/v8.5.40/bin/apache-tomcat-8.5.40.tar.gz
RUN	        tar -zxvf apache-tomcat-8.5.40.tar.gz
RUN	        mv apache-tomcat-8.5.40 tomcat8
WORKDIR	    /home/tomcat8/bin
RUN	        sudo ./startup.sh
RUN	        sudo rm /home/$userName/apache-tomcat-8.5.40.tar.gz

# 3. ffmpeg 설치
WORKDIR	    /home/
RUN	        sudo apt-get -y install autoconf automake build-essential libass-dev libfreetype6-dev libgpac-dev libsdl1.2-dev libtheora-dev libtool libva-dev libvdpau-dev libvorbis-dev libx11-dev libxext-dev libxfixes-dev pkg-config texi2html zlib1g-dev
RUN	        mkdir ffmpeg_sources
WORKDIR	    /home/ffmpeg_sources/
RUN	        wget http://www.tortall.net/projects/yasm/releases/yasm-1.2.0.tar.gz
RUN	        tar xvfz yasm-1.2.0.tar.gz
WORKDIR	    /home/ffmpeg_sources/yasm-1.2.0/
RUN	        ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin"
RUN	        make
RUN	        make install
RUN	        make distclean
WORKDIR	    /home/ffmpeg_sources/
RUN	        wget http://www.nasm.us/pub/nasm/releasebuilds/2.13.01/nasm-2.13.01.tar.xz
RUN	        tar xvf nasm-2.13.01.tar.xz
WORKDIR	    /home/ffmpeg_sources/nasm-2.13.01/
RUN	        ./configure
RUN	        make
RUN	        sudo make install
WORKDIR	    /home/ffmpeg_sources/
RUN	        wget http://download.videolan.org/pub/x264/snapshots/last_x264.tar.bz2
RUN	        tar xjvf last_x264.tar.bz2
WORKDIR	    /home/ffmpeg_sources/x264-snapshot*/
RUN	        PATH="$PATH:$HOME/bin" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --enable-static
RUN	        make
RUN	        make install
RUN	        make distclean
WORKDIR	    /home/ffmpeg_sources/
RUN	        wget -O fdk-aac.zip https://github.com/mstorsjo/fdk-aac/zipball/master
RUN	        unzip fdk-aac.zip
WORKDIR	    /home/ffmpeg_sources/mstorsjo-fdk-aac*/
RUN	        autoreconf -fiv
RUN	        ./configure --prefix="$HOME/ffmpeg_build" --disable-shared
RUN	        make
RUN	        make install
RUN	        make distclean
RUN	        sudo apt-get install libmp3lame-dev
WORKDIR	    /home/ffmpeg_sources/
RUN	        wget http://downloads.xiph.org/releases/opus/opus-1.1.tar.gz
RUN	        tar xvfz opus-1.1.tar.gz
WORKDIR	    /home/ffmpeg_sources/opus-1.1/
RUN	        ./configure --prefix="$HOME/ffmpeg_build" --disable-shared
RUN	        make
RUN	        make install
RUN	        make distclean
WORKDIR	    /home/ffmpeg_sources/
RUN	        wget http://github.com/webmproject/libvpx/archive/v1.7.0/libvpx-1.7.0.tar.gz
RUN	        tar xvfz libvpx-1.7.0.tar.gz
WORKDIR	    /home/ffmpeg_sources/libvpx-1.7.0/
RUN	        ./configure --prefix="$HOME/ffmpeg_build" --disable-examples
RUN	        make
RUN	        make install
RUN	        make clean
WORKDIR	    /home/ffmpeg_sources/
RUN	        wget http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
RUN	        tar xjvf ffmpeg-snapshot.tar.bz2
WORKDIR	    /home/ffmpeg_sources/ffmpeg/
RUN	        PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure   --prefix="$HOME/ffmpeg_build"   --pkg-config-flags="--static"   --extra-cflags="-I$HOME/ffmpeg_build/include"   --extra-ldflags="-L$HOME/ffmpeg_build/lib"   --extra-libs="-lpthread -lm"   --bindir="$HOME/bin"   --enable-gpl   --enable-libass   --enable-libfdk-aac   --enable-libfreetype   --enable-libmp3lame   --enable-libopus   --enable-libtheora   --enable-libvorbis   --enable-libvpx   --enable-libx264  --enable-nonfree
RUN	        make
RUN	        make install
RUN	        make distclean
RUN	        hash -r
RUN	        echo "MANPATH_MAP $HOME/bin $HOME/ffmpeg_build/share/man" >> ~/.manpath
RUN	        . ~/.profile
RUN	        sudo apt install ffmpeg

# 4. Home에 Web Application 복사 및 실행
RUN	        mkdir /home/tomcat8/webapps/ROOT/dashboard
WORKDIR	    /home/
RUN	        cp -r * /home/tomcat8/webapps/ROOT/dashboard/.
RUN	        xdg-open 'localhost:8080/dashboard/WebContent/'



