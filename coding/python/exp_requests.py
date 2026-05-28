import requests

print("==========================================================")
print("            COMPLETE REQUESTS MODULE METHOD PROFILE       ")
print("==========================================================\n")

# 1. requests.get()
print(' requests.get("https://httpbin.org")')
res_get = requests.get("https://httpbin.org")
print(
    "Executed command : Send an HTTP GET request to retrieve data from a target endpoint"
)
print(f"Returned Type    : {type(res_get)}")
print(f"Printed Object   : {res_get}")
print("Captured stdout  : Response container instance linked to status code\n")

# 2. Response.status_code
print(" res_get.status_code")
res_status = res_get.status_code
print("Executed command : Extract the numeric HTTP status code returned by the server")
print(f"Returned Type    : {type(res_status)}")
print(f"Printed Object   : {res_status}")
print(f"Captured stdout  : {res_status}\n")

# 3. Response.ok
print(" res_get.ok")
res_ok = res_get.ok
print(
    "Executed command : Evaluate boolean check if status code is less than 400 (success indicator)"
)
print(f"Returned Type    : {type(res_ok)}")
print(f"Printed Object   : {res_ok}")
print(f"Captured stdout  : {res_ok}\n")

# 4. Response.text
print(" res_get.text")
res_text = res_get.text
print(
    "Executed command : Decode the response body contents into a raw text string wrapper"
)
print(f"Returned Type    : {type(res_text)}")
print(f"Printed Object   : '{res_text[:55]}... (Truncated)'")
print("Captured stdout  : Raw decoded response content payload string block\n")

# 5. Response.json()
print(" res_get.json()")
res_json = res_get.json()
print(
    "Executed command : Parse JSON formatted response text directly into standard Python dictionaries"
)
print(f"Returned Type    : {type(res_json)}")
print(f"Printed Object   : {list(res_json.keys())}")
print(
    "Captured stdout  : Extracted top-level JSON mapping keys dictionary index array\n"
)

# 6. Response.content
print(" res_get.content")
res_content = res_get.content
print(
    "Executed command : Read raw response body bytes directly (essential for files, images, or zip downloads)"
)
print(f"Returned Type    : {type(res_content)}")
print(f"Printed Object   : {res_content[:25]}...")
print("Captured stdout  : Raw binary data bytes container profile\n")

# 7. Response.headers
print(" res_get.headers")
res_headers = res_get.headers
print(
    "Executed command : Fetch case-insensitive lookup dictionary tracking server metadata headers"
)
print(f"Returned Type    : {type(res_headers)}")
print(
    f"Printed Object   : {{'Content-Type': '{res_headers.get('Content-Type')}', 'Server': '{res_headers.get('Server')}'}}"
)
print("Captured stdout  : Metadata configuration properties mapping payload\n")

# 8. requests.post()
print(' requests.post("https://httpbin.org", json={"id": 100})')
res_post = requests.post("https://httpbin.org", json={"id": 100})
print(
    "Executed command : Send an HTTP POST payload request pushing data parameters to server database maps"
)
print(f"Returned Type    : {type(res_post)}")
print(f"Printed Object   : {res_post}")
print(f"Captured stdout  : {res_post}\n")

# 9. requests.head()
print(' requests.head("https://httpbin.org")')
res_head = requests.head("https://httpbin.org")
print(
    "Executed command : Extract connection header maps swiftly omitting the heavier document file body"
)
print(f"Returned Type    : {type(res_head)}")
print(f"Printed Object   : {res_head}")
print(f"Captured stdout  : {res_head}\n")

# 10. Response.raise_for_status()
print(" res_get.raise_for_status()")
res_raise = res_get.raise_for_status()
print(
    "Executed command : Raise an HTTPError exception instantly if the response returns a 4xx or 5xx fail code"
)
print(f"Returned Type    : {type(res_raise)}")
print(f"Printed Object   : {res_raise}")
print(
    "Captured stdout  : None (Passes silently with zero output if transaction was clean)\n"
)
