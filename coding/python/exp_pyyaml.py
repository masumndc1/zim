import yaml

# Set up dummy YAML data structures for execution metrics
mock_yaml_string = """
system:
  host: "127.0.0.1"
  port: 8080
  services:
    - ssh
    - nginx
"""

mock_data_dict = {"database": {"driver": "postgres", "pool": 10, "enabled": True}}

print("==========================================================")
print("           COMPLETE PYYAML MODULE METHOD PROFILE          ")
print("==========================================================\n")

# 1. yaml.safe_load()
print(" yaml.safe_load(mock_yaml_string)")
res_load = yaml.safe_load(mock_yaml_string)
print(
    "Executed command : Parse a raw YAML document string safely into standard Python objects"
)
print(f"Returned Type    : {type(res_load)}")
print(f"Printed Object   : {res_load}")
print(f"Captured stdout  : {res_load}\n")

# 2. yaml.safe_dump()
print(" yaml.safe_dump(mock_data_dict)")
res_dump = yaml.safe_dump(mock_data_dict)
print(
    "Executed command : Serialize a native Python dictionary/list into a formatted YAML string"
)
print(f"Returned Type    : {type(res_dump)}")
print(f"Printed Object   : '\\n{res_dump.strip()}'")
print(f"Captured stdout  : '\\n{res_dump.strip()}'\n")

# 3. yaml.safe_load_all()
print(' yaml.safe_load_all("---\\nitem: 1\\n---\\nitem: 2")')
multi_document_string = "---\nitem: 1\n---\nitem: 2"
res_loadall = yaml.safe_load_all(multi_document_string)
print('Executed command : Parse a multi-document YAML stream separated by "---"')
print(f"Returned Type    : {type(res_loadall)}")
print(f"Printed Object   : {res_loadall}")
print(f"Captured stdout  : List translation: {list(res_loadall)}\n")

# 4. yaml.safe_dump_all()
print(' yaml.safe_dump_all([{"doc": 1}, {"doc": 2}])')
res_dumpall = yaml.safe_dump_all([{"doc": 1}, {"doc": 2}])
print(
    "Executed command : Serialize a list of separate dictionaries into a multi-document YAML stream"
)
print(f"Returned Type    : {type(res_dumpall)}")
print(f"Printed Object   : '\\n{res_dumpall.strip()}'")
print(f"Captured stdout  : '\\n{res_dumpall.strip()}'\n")
