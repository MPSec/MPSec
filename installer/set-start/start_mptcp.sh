sysctl -w net.mptcp.mptcp_enabled=1
sysctl -w net.mptcp.mptcp_checksum=0
sysctl -w net.mptcp.mptcp_path_manager=fullmesh
sysctl -w net.mptcp.mptcp_scheduler=default
sysctl -w net.ipv4.tcp_congestion_control=olia