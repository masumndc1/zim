awk '$1 == "STOP" { exit } $1 == "skip" { next } { print "processed:", $0 } END { print "done" }' stream.log
