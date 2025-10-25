#!/usr/bin/python3

import subprocess


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
