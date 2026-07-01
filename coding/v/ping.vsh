#!/usr/bin/env v

import os
import arrays

cur_dir := os.getwd()
// cur_dir := os.getwd()
println(cur_dir)
result := os.execute('ping -c 1 google.com')
println('Ping command output:\n ${result.output}')
if result.exit_code != 0 {
	return
}
minimum := arrays.min([1, 2, 3, 0, 9])! // => 0
maximum := arrays.max([1, 2, 3, 0, 9])! // => 0
// println('${minimum}')
println(minimum)
println(maximum)

result1 := os.execute('ping -c 1 google.com')
for out in result1.output.split('\n') {
	if out.contains('google') {
		println(out)
	}
}
