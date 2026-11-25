awk 'BEGIN { OFS="," } { NF--; $3 = "active"; print $0 }' records.txt
