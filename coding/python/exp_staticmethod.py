#!/usr/bin/env python3


"""
The @staticmethod decorator is a built-in Python tool used to define a method
inside a class that does not require access to either the class itself or any
of its specific object instances. It behaves exactly like a regular, isolated
function, but it is grouped inside the class purely for logical organization
and code neatness.

object vs class vs static methods:
To understand @staticmethod, you must see how it differs from the other two
methods in Python's class architecture. It completely removes the automatic
first argument tracking requirement ('self' or 'cls'): see line number 29.

core rules an design strategy

* No State Mutation: A static method cannot read or alter class variables or
  instance attributes. If you try to use 'self' or 'cls' inside it without
  passing them as regular manual arguments, your code will throw an error.

* Namespace Organization: You could just write 'format_currency' as a plain
  standalone function at the top of your file. However, putting it inside
  'PaymentGateway' as a static method signals to other developers that this
  helper function belongs exclusively to the payment architecture.

* Easier Testing: Because static methods are "pure functions" (their output
  depends entirely on their inputs, with no background variables), they are
  incredibly simple to target with unit tests.

"""


class Demo:
    # 1. Instance Method: Needs 'self' to read/write unique object properties
    def instance_method(self):
        return "I have access to the unique instance via self"

    # 2. Class Method: Needs 'cls' to read/write global class state
    @classmethod
    def class_method(cls):
        return "I have access to the shared class blueprint via cls"

    # 3. Static Method: Needs NO automatic first argument
    @staticmethod
    def static_method(x, y):
        return x + y  # Acts like an isolated math function


# grouping utility helpers
# The absolute best use case for a static method is writing utility functions
# that support a class, but don't need to touch any data stored inside the class.
# Imagine you are building an e-commerce checkout processor:


class PaymentGateway:
    def __init__(self, api_key):
        self.api_key = api_key  # Bound instance state

    def charge(self, amount):
        """Instance method: Needs the api_key to function."""
        print(f"Charging ${amount} using API key: {self.api_key}")

    @staticmethod
    def format_currency(amount):
        """Static method: A pure utility.
        It doesn't care about API keys; it just formats numbers."""
        return f"${amount:,.2f}"


# --- Calling the Methods ---
# 1. to use the instance method, you MUST create an object instance first
gateway = PaymentGateway(api_key="sk_test_12345")
gateway.charge(50)

# 2. to use the static method, you can call it directly off the class!
# even, you do NOT need to create a 'gateway' object instance first.
formatted_text = PaymentGateway.format_currency(1250.5)
print(formatted_text)  # Outputs: $1,250.50


# > python3 exp_staticmethod.py
# output:
# Charging $50 using API key: sk_test_12345
# $1,250.50
