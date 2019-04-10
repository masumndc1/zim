#!/usr/bin/python
#web_func.py

import urllib

def web_headers(url):
        url_file=urllib.urlopen("http://"+url)
        h=url_file.headers
        return h

def web_status(url):
        url_file=urllib.urlopen("http://"+url)
        return url_file.code

def web_url(url):
        full_url=urllib.urlopen("http://"+url)
        return full_url.url
