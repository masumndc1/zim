#df -h | awk '{ print $1, $2, $6 }'
ps aux | awk 'NR == 1 || $3 > 10.0 { printf "%-10s %-6s %s\n", $1, $3, 11 }'
#free -m | awk '/^Mem:/ { print $2 }'
