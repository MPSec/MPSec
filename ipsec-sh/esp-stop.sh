kill -9 `ps -ef | grep out | awk '{print $2}'`
kill -9 `ps -ef | grep wget | awk '{print $2}'`
ipsec stop
