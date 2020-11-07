# 1. IPSec Start
ipsec start

# 2. Service Tomcat Stop & Sudo Tomcat Start
service tomcat8 stop
/home/tomcat8/bin/startup.sh

# 3. MPSec Start
sysctl -w net.mptcp.mptcp_enabled=1
sysctl -w net.mptcp.mptcp_checksum=0
sysctl -w net.mptcp.mptcp_path_manager=fullmesh
sysctl -w net.mptcp.mptcp_scheduler=default
sysctl -w net.ipv4.tcp_congestion_control=olia

# 4. ffmpeg refresh & ffserver start
#kill -9 `ps -ef | grep ffmpeg | awk '{print $2}'`
#ffserver -f /home/tomcat8/webapps/ROOT/MPSec/conf/ffserver.conf

# 5. Open Web Application
#xdg-open 'localhost:8080/MPSec/WebContent/index.html' &

