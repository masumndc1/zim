#!/usr/bin/env python3

from collections import defaultdict


class CallCount:
    """
    This module will return how many times
    this module was called with same parameters
    """

    def __init__(self):
        self._count = defaultdict(int)

    def __call__(self, argument):
        self._count[argument] += 1
        return self._count[argument]
