#!/usr/bin/python3.4

import sys

"""
import urllib
from urllib.request import urlopen

response=urlopen(sys.argv[1])
print(response.getheaders(Content-Type))
"""

from urllib.request import Request
from urllib.request import urlopen

response=Request(sys.argv[1])
req=response.add_header('Accept-Language', 'sv')
s=urlopen(req)
s.readlines()


from urllib.request import Request
req=Request('http://www.debian.org')
 

response=req.add_header('Accept-Language', 'sv')


