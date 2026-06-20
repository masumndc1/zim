#!/usr/bin/env python3

"""
A one-liner in Python is most commonly called a List Comprehension:
(if it creates a list), a Lambda Function: (if it is an anonymous function),
or a Ternary Operator: (if it is a single-line if/else statement). Broadly,
single-line data transformations are called Comprehensions or Expressions
"""

# Multi-line way
squares = []
for x in range(5):
    squares.append(x * x)

# One-liner way (List Comprehension)
squaress = [x * x for x in range(5)]
print("normal_way:", squares)
print("by_comprehension:", squaress)


# lampda way
# Multi-line way
def double(x):
    return x * 2


# One-liner way (Lambda Function)
# double = lambda a: a * 2
# print("lambda:", double(3))

# Multi-line way
age = 19
if age >= 18:
    status = "Adult"
else:
    status = "Minor"

# One-liner way (Conditional Expression)
status = "Adult" if age >= 18 else "Minor"

# walrus operator
# Calculates length and checks condition all in one line
if (n := len("segments")) > 5:
    print(f"Too many pieces: {n}")

# output:

# > python3 exp_comprehension.py
# normal_way: [0, 1, 4, 9, 16]
# by_comprehension: [0, 1, 4, 9, 16]
# lambda: 6
# Too many pieces: 8
