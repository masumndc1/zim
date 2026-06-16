#!/usr/bin/env python3


"""
The @cached_property decorator transforms a class method into
a property that computes its value exactly once and then caches
it as a normal attribute for all future reads.

It is part of Python’s standard library (functools module)
and is ideal for expensive, read-heavy operations that do not
change over the lifetime of an object.

"""

import time
from functools import cached_property


class Dashboard:
    @property
    def heavy_calculation(self):
        print("Computing data...")
        # Simulates an expensive operation
        time.sleep(2)
        return 42


dash = Dashboard()
# Takes 2 seconds, prints "Computing data...", returns 42
# Takes ANOTHER 2 seconds, prints "Computing data..." again!
print(dash.heavy_calculation)
print(dash.heavy_calculation)


class SpeedyDashboard:
    @cached_property
    def heavy_calculation(self):
        print("Computing data...")
        # Simulates an expensive operation
        time.sleep(2)
        return 24


speedydash = SpeedyDashboard()
# Takes 2 seconds, prints "Computing data...", returns 24
# Instantaneous! Returns 24 directly from cache without printing.
print(speedydash.heavy_calculation)
print(speedydash.heavy_calculation)


# output:
# Computing data...
# 42
# Computing data...
# 42
# Computing data...
# 24
# 24
