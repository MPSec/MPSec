ipsec start
service tomcat8 stop
/home/user/tomcat8/bin/startup.sh
sysctl -w net.mptcp.mptcp_enabled=1
sysctl -w net.mptcp.mptcp_checksum=0
sysctl -w net.mptcp.mptcp_path_manager=fullmesh
sysctl -w net.mptcp.mptcp_scheduler=default
sysctl -w net.ipv4.tcp_congestion_control=olia
kill -9 `ps -ef | grep ffmpeg | awk '{print $2}'`
ffserver -f /home/user/tomcat8/webapps/ROOT/dashboard/conf/ffserver.conf
