#!/usr/bin/python3.4

import sys
from urllib.request import urlopen

try:
	rfc_number = int(sys.argv[1])

except (IndexError, ValueError):
	print('Must supply an RFC number as first argument')
	sys.exit(2)

template = 'http://www.ietf.org/rfc/rfc{}.txt'
url = template.format(rfc_number)
rfc_raw = urlopen(url).read()
rfc = rfc_raw.decode()
print(rfc)
