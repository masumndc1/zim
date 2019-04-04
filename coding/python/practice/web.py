#!/usr/bin/python

import sys
import urllib

if len(sys.argv) < 2:
    print "usage: python web.py www.debian.org"
else:
    url_file=urllib.urlopen("http://"+sys.argv[1])
    url_docs=url_file.read()
    h=url_file.headers
    print ""
    print "number of bytes copied:\t",len(url_docs)
    print "status code:\t\t ", url_file.code
    print ""
    print h
