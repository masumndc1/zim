#!/usr/bin/env python3

import random

count = 1
while count < 100:
    a = random.randint(0,100)
    b = random.randint(0,100)
    c = a + b
    if a > b and c < 100:
        #c = a - b
        #print("{} - {} = {}".format(a,b,c))
        print("{}  {} + {}".format(count,a,b))
        count = count + 1
