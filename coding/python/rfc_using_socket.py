#!/usr/bin/python

import sys, socket

try:
		rfc_number = int(sys.argv[1])

except (IndexError, ValueError):
		print('Must supply an RFC number as first argument')
		sys.exit(2)

host = 'www.ietf.org'
port = 80

sock = socket.create_connection((host, port))
