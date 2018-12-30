ffmpeg -i ftp://user:1@192.168.10.2/sample.mp4 -hls_allow_cache 0 -threads 8 -cpu-used 5 -deadline realtime -an http://localhost:12390/feed1.ffm
