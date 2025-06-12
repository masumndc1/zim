... show all routes in mac

usage: route [-dnqtv] command [[modifiers] args]
❯ netstat -rn -f inet
Routing tables

Internet:
Destination Gateway Flags Netif Expire
default 192.168.2.1 UGScg en0
default link#20 UCSIg bridge100 !
default link#24 UCSIg bridge101 !
x.x.160.92 192.168.2.1 UGHS en0
127 127.0.0.1 UCS lo0
127.0.0.1 127.0.0.1 UH lo0
169.254 link#11 UCS en0 !
192.168.2 link#11 UCS en0 !
192.168.2.1/32 link#11 UCS en0 !
192.168.2.1 10:3c:59:4:43:e6 UHLWIir en0 1199
192.168.2.2/32 link#11 UCS en0 !
192.168.2.2 5e:52:4e:b4:3a:6e UHLWI lo0
192.168.2.2 link#20 UHLWIg bridge100 !
192.168.2.2 link#24 UHLWIg bridge101 !
192.168.2.9 e4:ce:8f:2:bb:32 UHLWI en0 985
192.168.2.255 ff:ff:ff:ff:ff:ff UHLWbI en0 !
192.168.180.1 12.b5.88.d6.27.64 UHLWIig lo0
192.168.180.1 link#24 UHLWIg bridge101 !
192.168.180.255 ff.ff.ff.ff.ff.ff UHLWbIg bridge100 !
192.168.244.1 link#20 UHLWIg bridge100 !
192.168.244.1 12.b5.88.d6.27.65 UHLWIig lo0
192.168.244.255 ff.ff.ff.ff.ff.ff UHLWbIg bridge101 !
224.0.0/4 link#11 UmCS en0 !
224.0.0.251 1:0:5e:0:0:fb UHmLWI en0
224.0.0.251 1:0:5e:0:0:fb UHmLWIg bridge100
224.0.0.251 1:0:5e:0:0:fb UHmLWIg bridge101
255.255.255.255/32 link#11 UCS en0 !
❯

... to delete particular a route
... sudo route delete x.x.160.92
