

... the content of __init__.py file.
... definition in __init__.py file will tell other 
... python files how is the code hierarchy.

your_package/
  __init__.py
  file1.py
  file2.py
    ...
  fileN.py

# in __init__.py
from .file1 import *
from .file2 import *
...
from .fileN import *

# in file1.py
def add():
    pass

... then others can call add() by

 from your_package import add

... without knowing file1's inside functions, like

 from your_package.file1 import add

