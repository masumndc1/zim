#!/usr/bin/env python3

"""
Think of @property as a tool that transforms a standard Python function
so it acts exactly like a regular variable on the outside, while keeping all
the power of a hidden function on the inside.

Without @property, you must use parentheses () to call a function:
user.get_email() (Feels like a function)
With @property, you drop the parentheses entirely:
user.email. (Feels like a simple variable)

"""

from __future__ import annotations
# from pydantic import validate_call


class Rectangle:
    def __init__(self, width: int, height: int) -> None:
        self.width = width
        self.height = height

    @property
    def area(self):
        return self.width * self.height


shape = Rectangle(5, 10)
# shape = Rectangle("abc", "def")
print(shape.area)

# when we need to force user to provide proper data
# we can pydantic module like above
#
# Traceback (most recent call last):
#   File "/Users/khuddin/Documents/github/zim/coding/python/exp_property.py", line 31, in <module>
#     print(shape.area)
#           ^^^^^^^^^^
#   File "/Users/khuddin/Documents/github/zim/coding/python/exp_property.py", line 26, in area
#     return self.width * self.height
#            ~~~~~~~~~~~^~~~~~~~~~~~~
# TypeError: can't multiply sequence by non-int of type 'str'
#
