kill -9 `ps -ef | grep ffmpeg | awk '{print $2}'`
