# Example 6: Match regex with ~ and !~
awk '$2 ~ /ERROR|WARN/ { print $1, $2, $3 }' logs.txt
# Example 7: Skip header row using NR > 1
awk 'NR > 1 { print NR - 1 ": " $1 " scored " $2 }' scores.txt
# Example 8: Branch inside an action with if / else
awk '{ if ($2 == "ERROR") tag = "[ALERT]"; else tag = "[ok]"; print tag, $3, $4 }' logs.txt
# Example 9: Align columns and decimals with printf
awk '{ printf "%-10s $%6.2f\n", $1, $2 }' prices.txt
