#!usr/bin/env python3

import ipaddress


# Define the IPv6 address
addr = ipaddress.IPv6Address("2001:708:10:4008:f::84f")

# Define the subnet
subnet = ipaddress.IPv6Network("2001:708:10:10::/64")

# Check membership
print(addr in subnet)  # Returns True or False
