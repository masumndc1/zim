#!/usr/bin/env python3

"""
in Python, os.environ is a dictionary-like mapping object that allows you
to read, write, and delete your operating system's environment variables.
It lives inside Python’s built-in os module and is the primary tool used
for storing sensitive configuration values like API keys, database URLs,
and environment states (production vs development)
"""

import os

# Dangerous: Crashes with a KeyError if 'DATABASE_URL' isn't set
# db = os.environ["DATABASE_URL"]

#  Safe Approach 1: Returns None if missing
db = os.environ.get("DATABASE_URL")

#  Safe Approach 2: Returns a fallback default if missing
port = os.environ.get("PORT", "8080")

# Alternative syntax built into the os module directly
api_key = os.getenv("API_KEY", "default_secret")

print(db, port, api_key)

# writing
# # Keys and values MUST always be strings
#
# os.environ["DEBUG_MODE"] = "True"
# os.environ["MAX_CONNECTIONS"] = "100"
#
# if "TEMPORARY_TOKEN" in os.environ:
#     del os.environ["TEMPORARY_TOKEN"]
#

# Modern Best Practice: Using an .env File
# pip install python-dotenv
#
# Contents of your local hidden .env file
# DATABASE_URL=postgres://localhost:5432/mydb
# SECRET_KEY=super_secret_string
# #
# #
# import os
# from dotenv import load_dotenv

# # Automatically searches for a .env file and injects its contents into os.environ
# load_dotenv()

# # Now read them cleanly anywhere in your app
# db_path = os.environ.get("DATABASE_URL")
