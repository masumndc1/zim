#!/usr/bin/env python3


import sys

print("==========================================================")
print("            COMPLETE SYS MODULE METHOD PROFILE            ")
print("==========================================================\n")

# 1. sys.argv
print(" sys.argv")
res_argv = sys.argv
print("Executed command : Fetch script execution command line arguments list")
print(f"Returned Type    : {type(res_argv)}")
print(f"Printed Object   : {res_argv}")
print(f"Captured stdout  : {res_argv}\n")

# 2. sys.executable
print(" sys.executable")
res_exec = sys.executable
print("Executed command : Grab absolute path of the running Python interpreter binary")
print(f"Returned Type    : {type(res_exec)}")
print(f"Printed Object   : '{res_exec}'")
print(f"Captured stdout  : '{res_exec}'\n")

# 3. sys.platform
print(" sys.platform")
res_plat = sys.platform
print("Executed command : Get operating system platform identifier string")
print(f"Returned Type    : {type(res_plat)}")
print(f"Printed Object   : '{res_plat}'")
print(f"Captured stdout  : '{res_plat}'\n")

# 4. sys.version
print(" sys.version")
res_ver = sys.version
print("Executed command : Retrieve complete compiler version compilation details")
print(f"Returned Type    : {type(res_ver)}")
print(f"Printed Object   : '{res_ver[:60]}...'")
print(f"Captured stdout  : '{res_ver[:60]}...'\n")

# 5. sys.path
print(" sys.path")
res_path = sys.path
print("Executed command : List search path directories used when importing modules")
print(f"Returned Type    : {type(res_path)}")
print(f"Printed Object   : {res_path[:2]} ... (Truncated)")
print(f"Captured stdout  : {res_path[:2]}\n")

# 6. sys.modules
print(" sys.modules.keys()")
res_mods = list(sys.modules.keys())
print("Executed command : Review global dictionary cache tracking imported modules")
print(f"Returned Type    : {type(res_mods)}")
print(f"Printed Object   : {res_mods[:3]} ... (Truncated)")
print(f"Captured stdout  : {res_mods[:3]}\n")

# 7. sys.getsizeof()
print(" sys.getsizeof([1, 2, 3])")
res_size = sys.getsizeof([1, 2, 3])
print("Executed command : Calculate exact memory footprint size of an object in bytes")
print(f"Returned Type    : {type(res_size)}")
print(f"Printed Object   : {res_size}")
print(f"Captured stdout  : {res_size}\n")

# 8. sys.getfilesystemencoding()
print(" sys.getfilesystemencoding()")
res_enc = sys.getfilesystemencoding()
print("Executed command : Fetch system codec name used to convert file paths")
print(f"Returned Type    : {type(res_enc)}")
print(f"Printed Object   : '{res_enc}'")
print(f"Captured stdout  : '{res_enc}'\n")

# 9. sys.getrecursionlimit()
print(" sys.getrecursionlimit()")
res_rec = sys.getrecursionlimit()
print("Executed command : Check maximum call stack nesting depth limits safely")
print(f"Returned Type    : {type(res_rec)}")
print(f"Printed Object   : {res_rec}")
print(f"Captured stdout  : {res_rec}\n")

# 10. sys.getrefcount()
print(" sys.getrefcount(res_rec)")
res_ref = sys.getrefcount(res_rec)
print(
    "Executed command : Inspect active memory pointer allocation reference tracker counts"
)
print(f"Returned Type    : {type(res_ref)}")
print(f"Printed Object   : {res_ref}")
print(f"Captured stdout  : {res_ref}\n")

# 11. sys.byteorder
print(" sys.byteorder")
res_byte = sys.byteorder
print("Executed command : Determine native hardware architecture memory byte ordering")
print(f"Returned Type    : {type(res_byte)}")
print(f"Printed Object   : '{res_byte}'")
print(f"Captured stdout  : '{res_byte}'\n")

# 12. sys.stdout.write()
print(' sys.stdout.write("Direct raw string bypass\\n")')
res_swrite = sys.stdout.write("Direct raw string bypass\n")
print(
    "Executed command : Push absolute string content buffer to system standard output stream"
)
print(f"Returned Type    : {type(res_swrite)}")
print(f"Printed Object   : {res_swrite}")
print("Captured stdout  : character count written to standard console out\n")

# Note: sys.exit() is omitted because executing it halts python entirely,
# preventing the script from printing remaining execution blocks.
