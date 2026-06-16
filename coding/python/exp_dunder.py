#!/usr/bin/env python3

"""
In Python, these four methods are dunder (double underscore)
special methods used to customize object behavior.
While __call__ allows an object to act like a function,
__get__, __set__, __delete__ collectively form Python Descriptor Protocol,
which controls how class attributes are accessed, modified, or deleted
"""


class Multiplier:
    def __init__(self, factor):
        self.factor = factor

    def __call__(self, value):
        return self.factor * value


# Usage
triple = Multiplier(3)
print(triple(10))
# Triggers __call__, outputs: 30

# output:
# without __call__()
# Traceback (most recent call last):
#   File "/Users/khuddin/Documents/github/zim/coding/python/exp_dunder.py", line 19, in <module>
#     print(triple(10))
#           ~~~~~~^^^^
# TypeError: 'Multiplier' object is not callable
#
# with __call__():
# 30
#
