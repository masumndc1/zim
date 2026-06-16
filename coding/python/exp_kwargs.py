#!/usr/bin/env python3

"""
description:
The kwargs.get(key, default) method is used inside Python functions
to safely extract optional keyword arguments (**kwargs) without risking
a KeyError. It retrieves the value if the argument was passed, and
seamlessly falls back to a specified default value if it was omitted

benefits:
When you define a function with **kwargs, Python collects all extra
named arguments into a standard dictionary.If you try to read a missing
key using standard bracket notation (kwargs["theme"]), your program will
crash. Using .get() protects your application from crashing

# The Dangerous Way (Crashes if theme is missing)
def configure_ui(**kwargs):
    theme = kwargs["theme"]  # Raises KeyError if not provided

# The Safe Way (Provides a default fallback)
def configure_ui(**kwargs):
    theme = kwargs.get("theme", "light")  # Safely returns "light" if missing

"""


def create_user(username, **kwargs):
    # 'username' is mandatory. The rest are optional.
    role = kwargs.get("role", "guest")
    status = kwargs.get("status", "active")

    print(f"User: {username} | Role: {role} | Status: {status}")


# Usage A: Using defaults
create_user("alice")
# Outputs: User: alice | Role: guest | Status: active

# Usage B: Overriding defaults
create_user("bob", role="admin", status="suspended")
# Outputs: User: bob | Role: admin | Status: suspended


# output:

# ❯ python3 exp_kwargs.py
# User: alice | Role: guest | Status: active
# User: bob | Role: admin | Status: suspended
