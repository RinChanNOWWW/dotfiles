host_ip="ip.address"
# for wsl: 
# host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")
port="port"
export http_proxy="http://$host_ip:$port"
export https_proxy="http://$host_ip:$port"
