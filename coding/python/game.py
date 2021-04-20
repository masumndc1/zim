#!/usr/bin/env python3

import random

count = 1
while count < 100:
    a = random.randint(0,100)
    b = random.randint(0,100)
    if a > b:
        #c = a - b
        #print("{} - {} = {}".format(a,b,c))
        print("{}  {} - {}".format(count,a,b))
        count = count + 1
