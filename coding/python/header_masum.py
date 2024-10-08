#!/usr/bin/python3.4

import sys
from urllib.request import urlopen
from urllib.request import Request

#res=Request('http://www.debian.org')

"""
... here we will pass the url with formate of like
 # ./header_masum.py debian.org

"""
template='http://www.{}'
urlreq=template.format(sys.argv[1])

#template.format(sys.argv[1])

res=Request(urlreq)

#res=Request(template)

res.add_header('Accept-Language', 'sv')
print()
print(res.header_items())
print('host name = ',res.host)
print('url type = ',res.type)
print()

response=urlopen(res)

# printing first fewlines and the page will be desplayed in swedish
# language.
#print(response.getheaders('Content-Type'))
print(response.getheaders()[:10])
print(response.readlines()[:5])

#response=urlopen(res)
#print(dir(response))
#print(response.header_items())
#print(s)

"""
there is another form of Request we can use. from the help of Request we got
class Request(builtins.object)
  Methods defined here:
   __init__(self, url, data=None, headers={}, origin_req_host=None, unverifiable=False, method=None)

... here we can add the header into the Request like value pair formate separeted
... with the :  like below.

>>> res=Request('http://www.debian.org', headers={'Accept-language': 'sv'} )

... here we have added the header information directly into the Request in
... header attribute with : between them. note here the formate of argument
... passing with the header value.

>>> res.headers.items()
dict_items([('Accept-language', 'sv')])
>>>
>>> res.full_url
'http://www.debian.org'
>>>
"""

""" output

[('Accept-language', 'sv')]
host name =  www.debian.org
url type =  http

[('Date', 'Fri, 02 Jun 2017 20:04:44 GMT'), ('Server', 'Apache'), ('Content-Location', 'index.sv.html'), ('Vary', 'negotiate,accept-language,Accept-Encoding'), ('TCN', 'choice'), ('X-Content-Type-Options', 'nosniff'), ('X-Frame-Options', 'sameorigin'), ('Referrer-Policy', 'no-referrer'), ('X-Xss-Protection', '1'), ('Last-Modified', 'Fri, 02 Jun 2017 16:38:54 GMT')]

... we have instruct the program to only show upto 10th item of the tuples and above
... command is showing something like that


[b'<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">\n', b'<html lang="sv">\n', b'<head>\n', b'  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">\n', b'  <title>Debian -- Det universella operativsystemet </title>\n']


"""
