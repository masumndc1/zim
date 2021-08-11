#!/usr/bin/env python3

import os
from subprocess import getoutput
import unittest

prg = "./hello.py"

class CheckNumbers(unittest.TestCase):
   def test_output(self):
      out = getoutput(f'python3 {prg}')
      self.assertEqual(out, "hello world")

if __name__ == "__main__":
   unittest.main()
