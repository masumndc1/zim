awk '{ sum = 0; for (i = 2; i <= NF; i++) sum += $i; printf "%s: avg=%.1f\n", $1, sum / (NF - 1) }' scores_row.txt
