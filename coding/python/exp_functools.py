#!/usr/bin/env python3


import functools


"""
    following methods of functools have been used in this example:
    @functools.reduce
    @functools.partial
    @functools.lru_cache
    @functools.wraps      # -> most used case
"""

# 1. reduce() → apply a function cumulatively

numbers = [1, 2, 3, 4, 5]
product = functools.reduce(lambda x, y: x * y, numbers)
print("Product of list:", product)
# Output: 120


# 2. partial() → fix some function arguments
def power(base, exponent):
    return base**exponent


square = functools.partial(power, exponent=2)
cube = functools.partial(power, exponent=3)

print("Square of 5:", square(5))  # 25
print("Cube of 3:", cube(3))  # 27


# 3. lru_cache → memoization for performance
@functools.lru_cache(maxsize=None)  # cache results (infinite size)
def fibonacci(n):
    if n < 2:
        return n
    return fibonacci(n - 1) + fibonacci(n - 2)


print("Fibonacci(10):", fibonacci(10))
# Output: 55 (way faster than plain recursion)

# 4. cmp_to_key → custom sorting
students = [
    {"name": "Alice", "score": 90},
    {"name": "Bob", "score": 75},
    {"name": "Charlie", "score": 85},
]


def compare(a, b):
    return a["score"] - b["score"]


sorted_students = sorted(students, key=functools.cmp_to_key(compare))
print("Sorted students by score:\n", sorted_students)
# Output: [{'name': 'Bob', 'score': 75}, {'name': 'Charlie', 'score': 85}, {'name': 'Alice', 'score': 90}]


# 1. Define the Decorator
def my_logger(func):
    @functools.wraps(func)  # <-- Keeps 'say_hello' from being renamed to 'wrapper'
    def wrapper(*args, **kwargs):
        print("LOG: Running function...")
        return func(*args, **kwargs)

    return wrapper


def say_hello_unwrap():
    """Prints a friendly greeting to the terminal."""
    print("Hello! I am from unwrap")


# 2. Use the Decorator
@my_logger
def say_hello():
    """Prints a friendly greeting to the terminal."""
    print("Hello! I am from wrap")


# 3. Test Identity
if __name__ == "__main__":
    print("\n")
    say_hello()  # Runs the log and the function
    # Check identity metadata from wrap
    print(f"Function Name: {say_hello.__name__}")
    print(f"Docstring:     {say_hello.__doc__}")

    print("\n")
    say_hello_unwrap()  # from unwrap
    # Check identity metadata from unwrap
    print(f"Function Name: {say_hello_unwrap.__name__}")
    print(f"Docstring:     {say_hello_unwrap.__doc__}")

# output:
# python3 exp_functools.py
# Product of list: 120
# Square of 5: 25
# Cube of 3: 27
# Fibonacci(10): 55
# Sorted students by score:
#  [{'name': 'Bob', 'score': 75}, {'name': 'Charlie', 'score': 85}, {'name': 'Alice', 'score': 90}]


# LOG: Running function...
# Hello!
# Function Name: say_hello
# Docstring:     Prints a friendly greeting to the terminal.
