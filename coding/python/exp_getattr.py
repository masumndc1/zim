#!/usr/bin/env python3

"""
getattr() is a built-in Python function used to look up and
retrieve an attribute (a variable, a method, or a function)
from an object using its name as a string.

It turns static code into dynamic code by letting you choose
what variable to read while the program is running

syntax:
getattr(object, attribute_name, default_value)

object: The target object you want to read from.attribute_name:
A string containing the exact name of the attribute.
default_value (Optional): The fallback value to return if the
attribute does not exist. If you leave this out and the attribute is missing,
Python will crash with an AttributeError.

core catch:
Normally, you read an attribute using static dot notation:
user.name (The name "name" must be hardcoded ahead of time)
With getattr(), you read it using a string variable:getattr(user, "name")
(The attribute name can change dynamically)

"""

from __future__ import annotations


class Screen:
    def __init__(self) -> None:
        self.N = "North Panel"
        self.E = "East Panel"
        # Notice: S and W are missing!


main_screen = Screen()

# 1. Successful lookup
# Output: "North Panel"
print(getattr(main_screen, "N"))

# 2. Missing lookup with a safe fallback
# Output: None (It didn't crash!)
print(getattr(main_screen, "S", None))

# output:
# North Panel
# None

# another example,
# when no attribute but default_value.
print(getattr(main_screen, "W", "WestHand"))
