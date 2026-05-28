import subprocess

print("=== 1. subprocess.run() ===")
# Returns: CompletedProcess object
# Best for 95% of use cases. Blocks execution and collects all metadata.
result_run = subprocess.run(["echo", "Hello from run"], capture_output=True, text=True)
print(f"Type: {type(result_run)}")
print(f"Exit Code: {result_run.returncode}")
print(f"Output: {result_run.stdout.strip()}\n")


print("=== 2. subprocess.call() [Legacy] ===")
# Returns: int (exit code)
# Blocks execution. Only tells you if it succeeded (0) or failed (non-zero).
exit_code = subprocess.call(
    ["ls", "/nonexistent_folder_xyz"], stderr=subprocess.DEVNULL
)
print(f"Type: {type(exit_code)}")
print(f"Exit Code: {exit_code}\n")


print("=== 3. subprocess.check_call() [Legacy] ===")
# Returns: int (always 0) or raises CalledProcessError
# Useful when a bad exit code should instantly crash your script.
try:
    success_code = subprocess.check_call(["true"])
    print(f"Type: {type(success_code)}")
    print(f"Returned: {success_code}\n")
except subprocess.CalledProcessError as e:
    print(f"Command failed with code {e.returncode}")


print("=== 4. subprocess.check_output() [Legacy] ===")
# Returns: bytes (or str if text=True)
# Directly returns the stdout instead of a container object.
output_bytes = subprocess.check_output(["uname", "-s"], text=True)
print(f"Type: {type(output_bytes)}")
print(f"Output: {output_bytes.strip()}\n")


print("=== 5. subprocess.getoutput() ===")
# Returns: str
# Evaluates via the system shell. Merges stdout and stderr into one string.
shell_output = subprocess.getoutput("echo $USER")
print(f"Type: {type(shell_output)}")
print(f"Output: {shell_output}\n")


print("=== 6. subprocess.getstatusoutput() ===")
# Returns: Tuple[int, str]
# Fast way to get both the numeric exit status and the shell string response.
status, text_out = subprocess.getstatusoutput("pwd")
print(f"Type: {type((status, text_out))}")
print(f"Status: {status}, Path: {text_out}\n")


print("=== 7. subprocess.list2cmdline() ===")
# Returns: str
# Does not run a process. Purely converts a list into a shell-escaped string.
escaped_str = subprocess.list2cmdline(
    ["tar", "-czf", "backup file.tar.gz", "/home/user"]
)
print(f"Type: {type(escaped_str)}")
print(f"Result: {escaped_str}\n")


print("=== 8. subprocess.Popen() ===")
# Returns: Popen object instance
# Non-blocking (Asynchronous). Spawns the process and instantly moves to the next line of code.
process = subprocess.Popen(["sleep", "1"])
print(f"Type: {type(process)}")
print(
    "Look! I printed this instantly while the 'sleep' command runs in the background."
)
process.wait()  # Force Python to wait until the background job is done before exiting
print("Background process has finished.\n")
#!/usr/bin/python3


def run_command(cmd):
    result = subprocess.run(
        cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True
    )
    return result.stdout.strip()


i = 0
fed = 0

# Get list of enabled repos
repos_output = run_command("yum repolist --enabled")
repos = [line.split()[0] for line in repos_output.splitlines() if line.strip()]

for a in repos:
    repo_info = run_command(
        f"yum repolist -v {a} | grep -E -i 'repo-id|baseurl|mirrors|repo-status'"
    )
    print(repo_info)
    print(a)

    if a.startswith("repo"):
        continue

    i += 1
    print(f"repo: {i}")

    if "fedora" in repo_info.lower():
        fed += 1

    print(f"fedora: {fed}")
    print("", end="")

print(f"total activated repo: {i}")
print(f"number of fedver repo: {fed}")


# [1] subprocess.run()
print('[1] subprocess.run(["echo", "Hello from run"], capture_output=True, text=True)')
res_run = subprocess.run(["echo", "Hello from run"], capture_output=True, text=True)
print('Executed command : echo "Hello from run"')
print(f"Returned Type    : {type(res_run)}")
print(f"Printed Object   : {res_run}")
print(f"Captured stdout  : {repr(res_run.stdout)}\n")

# [2] subprocess.call()
print(
    '[2] subprocess.call(["ls", "/nonexistent_directory_xyz"], stderr=subprocess.DEVNULL)'
)
res_call = subprocess.call(
    ["ls", "/nonexistent_directory_xyz"], stderr=subprocess.DEVNULL
)
print("Executed command : ls /nonexistent_directory_xyz 2>/dev/null")
print(f"Returned Type    : {type(res_call)}")
print(f"Printed Object   : {res_call}")
print("Captured stdout  : None\n")

# [3] subprocess.check_call()
print('[3] subprocess.check_call(["true"])')
res_ccall = subprocess.check_call(["true"])
print("Executed command : true")
print(f"Returned Type    : {type(res_ccall)}")
print(f"Printed Object   : {res_ccall}")
print("Captured stdout  : None\n")

# [4] subprocess.check_output()
print('[4] subprocess.check_output(["uname", "-s"], text=True)')
res_coutput = subprocess.check_output(["uname", "-s"], text=True)
print("Executed command : uname -s")
print(f"Returned Type    : {type(res_coutput)}")
print(f"Printed Object   : {repr(res_coutput)}")
print(f"Captured stdout  : {repr(res_coutput)}\n")

# [5] subprocess.getoutput()
print('[5] subprocess.getoutput("echo $USER")')
res_getout = subprocess.getoutput("echo $USER")
print("Executed command : echo $USER")
print(f"Returned Type    : {type(res_getout)}")
print(f"Printed Object   : {repr(res_getout)}")
print(f"Captured stdout  : {repr(res_getout)}\n")

# [6] subprocess.getstatusoutput()
print('[6] subprocess.getstatusoutput("pwd")')
res_statout = subprocess.getstatusoutput("pwd")
print("Executed command : pwd")
print(f"Returned Type    : {type(res_statout)}")
print(f"Printed Object   : {res_statout}")
print(f"Captured stdout  : {repr(res_statout[1])}\n")

# [7] subprocess.list2cmdline()
print(
    '[7] subprocess.list2cmdline(["tar", "-czf", "backup file.tar.gz", "/home/user"])'
)
res_listcmd = subprocess.list2cmdline(
    ["tar", "-czf", "backup file.tar.gz", "/home/user"]
)
print("Executed command : None (Utility Method)")
print(f"Returned Type    : {type(res_listcmd)}")
print(f"Printed Object   : {res_listcmd}")
print("Captured stdout  : None\n")

# [8] subprocess.Popen()
print('[8] subprocess.Popen(["sleep", "0.5"])')
res_popen = subprocess.Popen(["sleep", "0.5"])
print("Executed command : sleep 0.5 &")
print(f"Returned Type    : {type(res_popen)}")
print(f"Printed Object   : {res_popen}")
print("Captured stdout  : None (Stream Interface Required)")
res_popen.wait()
