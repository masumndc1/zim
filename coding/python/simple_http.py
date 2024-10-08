#!/usr/bin/python3.4

import http
import sys
import urllib
from urllib.request import urlopen
from urllib.request import Request

try:
	web_name = sys.argv[1]
#	template = "http://'{web_name}'"
	url_header=Request(web_name)
	print('header = ',url_header.header_items)
	response=urlopen(web_name)
	response
	response.readline()

	print('url = ',response.url)
	print('file = ',response.fileno)
	print('getcode = ',response.getcode)

	print(dir(http.client.HTTPResponse))
	print('getheader = ',response.getheader)
	print('status = ',response.status)
	print('reason = ',response.reason)
#	print('header = ',response.header_items)

#except urllib.error.HTTPError as e:
except urllib.error.URLError as e:

	print (e.errno)
	print (e.args)
	print (e.filename)
	print (e.characters_written)
	print (e.characters_written)
