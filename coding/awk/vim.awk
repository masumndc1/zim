#!/usr/bin/awk -f

BEGIN {
    os = detect_os()

    if (os == "debian_ubuntu") {
        cmd = "sudo apt-get update && sudo apt-get install -y vim"
    } else if (os == "macos") {
        cmd = "brew install vim"
    } else if (os == "freebsd") {
        cmd = "sudo pkg install -y vim"
    } else if (os == "openbsd") {
        cmd = "doas pkg_add vim || sudo pkg_add vim"
    } else if (os == "netbsd") {
        cmd = "su -m root -c 'pkg_add vim'"
    } else {
        print "Unsupported or undetected OS:", os > "/dev/stderr"
        exit 1
    }

    print "Detected OS:", os
    print "Running:", cmd
    rc = system(cmd)
    exit rc
}

function detect_os(    uname_s, line, id_like, os_id) {
    uname_s = ""
    if (("uname -s" | getline uname_s) > 0) {
        close("uname -s")
    }
    gsub(/^[[:space:]]+|[[:space:]]+$/, "", uname_s)

    if (uname_s == "Darwin")  return "macos"
    if (uname_s == "FreeBSD") return "freebsd"
    if (uname_s == "OpenBSD") return "openbsd"
    if (uname_s == "NetBSD")  return "netbsd"

    if (uname_s == "Linux") {
        os_id = ""
        id_like = ""
        while ((getline line < "/etc/os-release") > 0) {
            if (line ~ /^ID=/) {
                os_id = line
                sub(/^ID=/, "", os_id)
                gsub(/^"|"$/, "", os_id)
                os_id = tolower(os_id)
            } else if (line ~ /^ID_LIKE=/) {
                id_like = line
                sub(/^ID_LIKE=/, "", id_like)
                gsub(/^"|"$/, "", id_like)
                id_like = tolower(id_like)
            }
        }
        close("/etc/os-release")

        if (os_id == "ubuntu" || os_id == "debian" || id_like ~ /(debian|ubuntu)/) {
            return "debian_ubuntu"
        }
    }

    return uname_s ? uname_s : "unknown"
}
