import re

# Set up dummy string targets for parsing
log_line = "ERROR [2026-05-28] Connection failed from IP 192.168.1.50 status=500"
dirty_text = "Item123   Item456\tItem789"

print("==========================================================")
print("             COMPLETE RE MODULE METHOD PROFILE            ")
print("==========================================================\n")

# 1. re.search()
print(' re.search(r"IP (\\d+\\.\\d+\\.\\d+\\.\\d+)", log_line)')
res_search = re.search(r"IP (\d+\.\d+\.\d+\.\d+)", log_line)
print("Executed command : Scan string to find the FIRST substring match anywhere")
print(f"Returned Type    : {type(res_search)}")
print(f"Printed Object   : {res_search}")
print(f"Captured stdout  : Subgroup extraction: '{res_search.group(1)}'\n")

# 2. re.match()
print(' re.match(r"ERROR", log_line)')
res_match = re.match(r"ERROR", log_line)
print(
    "Executed command : Check if the string matches the pattern starting strictly from index 0"
)
print(f"Returned Type    : {type(res_match)}")
print(f"Printed Object   : {res_match}")
print(f"Captured stdout  : Initial position token: '{res_match.group(0)}'\n")

# 3. re.findall()
print(' re.findall(r"\\d+", log_line)')
res_findall = re.findall(r"\d+", log_line)
print(
    "Executed command : Extract all non-overlapping matches as an array list of strings"
)
print(f"Returned Type    : {type(res_findall)}")
print(f"Printed Object   : {res_findall}")
print(f"Captured stdout  : {res_findall}\n")

# 4. re.finditer()
print(' re.finditer(r"\\d+", log_line)')
res_finditer = re.finditer(r"\d+", log_line)
print(
    "Executed command : Return an iterator yielding re.Match instances for every match found"
)
print(f"Returned Type    : {type(res_finditer)}")
print(f"Printed Object   : {res_finditer}")
print(
    f"Captured stdout  : Extracted elements list: {[m.group() for m in res_finditer]}\n"
)

# 5. re.sub()
print(' re.sub(r"192\\.168\\.\\d+\\.\\d+", "REDACTED", log_line)')
res_sub = re.sub(r"192\.168\.\d+\.\d+", "REDACTED", log_line)
print("Executed command : Replace occurrences of a pattern with a replacement string")
print(f"Returned Type    : {type(res_sub)}")
print(f"Printed Object   : '{res_sub}'")
print(f"Captured stdout  : '{res_sub}'\n")

# 6. re.split()
print(' re.split(r"\\s+", dirty_text)')
res_split = re.split(r"\s+", dirty_text)
print(
    "Executed command : Split a string into a list array using a regex pattern as the delimiter"
)
print(f"Returned Type    : {type(res_split)}")
print(f"Printed Object   : {res_split}")
print(f"Captured stdout  : {res_split}\n")

# 7. re.compile()
print(' re.compile(r"status=(\\d+)")')
res_compile = re.compile(r"status=(\d+)")
print(
    "Executed command : Pre-compile a pattern string into an re.Pattern object for faster re-use"
)
print(f"Returned Type    : {type(res_compile)}")
print(f"Printed Object   : {res_compile}")
print("Captured stdout  : Pre-compiled expression shell container\n")

# 8. re.Pattern object execution (.search)
print(" res_compile.search(log_line)")
res_pat_search = res_compile.search(log_line)
print(
    "Executed command : Execute the pre-compiled pattern instance method on a target string"
)
print(f"Returned Type    : {type(res_pat_search)}")
print(f"Printed Object   : {res_pat_search}")
print(
    f"Captured stdout  : Matches parsed from cache target: '{res_pat_search.group(1)}'\n"
)

# 9. re.escape()
print(' re.escape("https://example.com")')
res_escape = re.escape("https://example.com")
print(
    "Executed command : Automatically escape special regex syntax tokens found in a literal string"
)
print(f"Returned Type    : {type(res_escape)}")
print(f"Printed Object   : '{res_escape}'")
print(f"Captured stdout  : '{res_escape}'\n")
