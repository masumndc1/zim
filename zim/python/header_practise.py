#!/usr/bin/python3.4

import sys
import urllib
from urllib.request import urlopen

response=urlopen(sys.argv[1])
print(response.getheaders())


