#!/bin/bash

userName="user"
kill -9 `ps -ef | grep ffmpeg | awk '{print $2}'`
ffserver -f /home/tomcat8/webapps/ROOT/MPSec/conf/ffserver.conf