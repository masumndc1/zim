#!/usr/bin/python

import sys
from web_func import *

for url in open('web_link.txt'):
#    url_header=web_headers(url)
#    print url_header
    full_url=web_url(url)
    status=web_status(url)
    print '\t', full_url, '\tstatus\t',status
