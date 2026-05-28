#!/usr/bin/env python3

import shutil
import os

# Set up temporary mock infrastructure for safe profiling
with open("source_file.txt", "w") as f:
    f.write("Automation structural metrics file layout.")
os.makedirs("source_dir", exist_ok=True)
with open("source_dir/nested.txt", "w") as f:
    f.write("Nested data payload.")

print("==========================================================")
print("           COMPLETE SHUTIL MODULE METHOD PROFILE          ")
print("==========================================================\n")

# 1. shutil.disk_usage()
print(' shutil.disk_usage(".")')
res_disk = shutil.disk_usage(".")
print(
    "Executed command : Query storage metrics (total, used, free space) on target disk"
)
print(f"Returned Type    : {type(res_disk)}")
print(f"Printed Object   : {res_disk}")
print(f"Captured stdout  : {res_disk}\n")

# 2. shutil.which()
print(' shutil.which("python3")')
res_which = shutil.which("python3")
print("Executed command : Identify absolute executable path of a system binary command")
print(f"Returned Type    : {type(res_which)}")
print(f"Printed Object   : '{res_which}'")
print(f"Captured stdout  : '{res_which}'\n")

# 3. shutil.get_terminal_size()
print(" shutil.get_terminal_size()")
res_term = shutil.get_terminal_size()
print(
    "Executed command : Determine width (columns) and height (lines) of active console window"
)
print(f"Returned Type    : {type(res_term)}")
print(f"Printed Object   : {res_term}")
print(f"Captured stdout  : {res_term}\n")

# 4. shutil.copy()
print(' shutil.copy("source_file.txt", "copied_file.txt")')
res_copy = shutil.copy("source_file.txt", "copied_file.txt")
print(
    "Executed command : Duplicate a file and sync user permission flags to destination path"
)
print(f"Returned Type    : {type(res_copy)}")
print(f"Printed Object   : '{res_copy}'")
print(f"Captured stdout  : '{res_copy}'\n")

# 5. shutil.copy2()
print(' shutil.copy2("source_file.txt", "copied_metadata_file.txt")')
res_copy2 = shutil.copy2("source_file.txt", "copied_metadata_file.txt")
print(
    "Executed command : Duplicate file while preserving all metadata (timestamps, stats)"
)
print(f"Returned Type    : {type(res_copy2)}")
print(f"Printed Object   : '{res_copy2}'")
print(f"Captured stdout  : '{res_copy2}'\n")

# 6. shutil.copyfile()
print(' shutil.copyfile("source_file.txt", "copied_raw_file.txt")')
res_copyfile = shutil.copyfile("source_file.txt", "copied_raw_file.txt")
print(
    "Executed command : Copy raw contents of a file efficiently without metadata or permissions"
)
print(f"Returned Type    : {type(res_copyfile)}")
print(f"Printed Object   : '{res_copyfile}'")
print(f"Captured stdout  : '{res_copyfile}'\n")

# 7. shutil.copytree()
print(' shutil.copytree("source_dir", "destination_dir")')
res_tree = shutil.copytree("source_dir", "destination_dir")
print("Executed command : Recursively clone an entire directory tree structure")
print(f"Returned Type    : {type(res_tree)}")
print(f"Printed Object   : '{res_tree}'")
print(f"Captured stdout  : '{res_tree}'\n")

# 8. shutil.make_archive()
print(' shutil.make_archive("backup_archive", "zip", "source_dir")')
res_arch = shutil.make_archive("backup_archive", "zip", "source_dir")
print(
    "Executed command : Compress target directory into an archive file format (ZIP, TAR)"
)
print(f"Returned Type    : {type(res_arch)}")
print(f"Printed Object   : '{res_arch}'")
print(f"Captured stdout  : '{res_arch}'\n")

# 9. shutil.get_archive_formats()
print(" shutil.get_archive_formats()")
res_formats = shutil.get_archive_formats()
print(
    "Executed command : Enumerate supported compression archive algorithms on host machine"
)
print(f"Returned Type    : {type(res_formats)}")
print(f"Printed Object   : {res_formats[:2]} ... (Truncated)")
print(f"Captured stdout  : {res_formats[:2]}\n")

# 10. shutil.move()
print(' shutil.move("copied_file.txt", "moved_file.txt")')
res_move = shutil.move("copied_file.txt", "moved_file.txt")
print(
    "Executed command : Relocate file or structural tree index securely across directories"
)
print(f"Returned Type    : {type(res_move)}")
print(f"Printed Object   : '{res_move}'")
print(f"Captured stdout  : '{res_move}'\n")

# 11. shutil.rmtree()
print(' shutil.rmtree("destination_dir")')
res_rmtree = shutil.rmtree("destination_dir")
print(
    "Executed command : Forcefully delete an entire folder structure containing items"
)
print(f"Returned Type    : {type(res_rmtree)}")
print(f"Printed Object   : {res_rmtree}")
print("Captured stdout  : None\n")

# Clean up structural artifacts to keep workstation pure
for path in [
    "source_file.txt",
    "copied_metadata_file.txt",
    "copied_raw_file.txt",
    "moved_file.txt",
    "backup_archive.zip",
]:
    if os.path.exists(path):
        os.remove(path)
shutil.rmtree("source_dir")
