awk '
  $0 == "---" {
    print "Unique:", length(seen)
    delete seen
    next
  }
  {
    seen[$0] = 1
  }
  END {
    print "Unique:", length(seen)
  }
' batches.txt
