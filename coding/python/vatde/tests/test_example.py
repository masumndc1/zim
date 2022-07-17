#!/usr/bin/env python3

import pytest
from src import Greetings

def test_greetings():
    assert Greetings.greetings() == "hello world!"
