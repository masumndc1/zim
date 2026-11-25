awk '{ print $1, "bought a", $2, "for $" $NF }' sales.txt
# Example 2: Filter rows with a numeric condition
awk '$3 >= 300 { print $1, $2, $3 }' sales.txt
# Example 3: Sum values and print summary in END
awk '{ sum += $3 } END { print "Total sales: $" sum }' sales.txt
# Example 4: Group and sum by key using associative arrays
awk '{ total[$1] += $3 } END { for (p in total) print p, total[p] }' sales.txt
# Example 5: Custom input/output field separators (-F and OFS)
awk -F',' 'BEGIN { OFS=" | " } { print $1, $2 * $3 }' items.csv
