#!/usr/bin/env python3

"""
class method works on directly on the class.
note below, how its being called. it is being called
from the class not but the instance.

classmethod vs staticmethod:
The Factory Pattern Standard:
Python does not allow you to write multiple __init__ methods with different
parameters (like Java or C++ do through method overloading). @classmethod
solves this elegantly by giving you a way to design distinct entry points.

When a subclass inherits from a base class, using cls(...) inside a class
method ensures that it dynamically constructs an instance of the subclass,
not the parent.

Class vs Static: If your utility function does not need to know anything about
the class it lives in, use @staticmethod.
If your function needs to update a global counter, track configurations,
or spin up new instances of the class, use @classmethod.

"""

from datetime import date


# random Person
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    @classmethod
    def fromBirthYear(cls, name, birthYear):
        return cls(name, date.today().year - birthYear)

    def display(self):
        print(self.name + "'s age is: " + str(self.age))


person = Person("Adam", 19)
person.display()

person1 = Person.fromBirthYear("John", 1985)
person1.display()
