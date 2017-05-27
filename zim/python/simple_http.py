#!/usr/bin/python3.4

from urllib.request import urlopen
response=urlopen('http://www.debian.org')
response
response.readline()

print('url = ',response.url)
print('status = ',response.status)
print('reason = ',response.reason)
