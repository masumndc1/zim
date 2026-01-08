#!/usr/bin/env python3
"""
 decorator in python can extend functionality of another function.
 consider the following.

 here, when ordinary() is called, it is called as make_pretty(oridinary)
 which goes to make_pretty(func).

 oridinary function executes after the inner function gets executed
 under make_pretty function. lastly, when inner function is returned,
 everything executed in the both functions.

- output:
I got decorated
I am oridinary

"""


def make_pretty(func):
    def inner():
        print("I got decorated")
        func()

    return inner


@make_pretty
def ordinary():
    print("I am ordinary")


@make_pretty
def extraordinary():
    print("I am extra-ordinary")


print("\nrunning ordinary:")
ordinary()
print("\nrunning extra-ordinary:")
extraordinary()
