userName="user"
kill -9 `ps -ef | grep ffmpeg | awk '{print $2}'`
ffserver -f /home/$userName/tomcat8/webapps/ROOT/dashboard/conf/ffserver.conf