// this is the example of how to create function
// in go-lang.

package main

import "fmt"

func main() {
	log("/var/log/messages")
	sum := add(2, 3)
	fmt.Println("sum is", sum)
	value, exists := power("khabir")
	if exists == true {
		fmt.Println("the value of value is", value)
	}
	_, isThere := test("masum")
	if isThere == false {
		fmt.Println("test func does not have any value")
	}
}
func log(message string) {}
func add(a, b int) int {
	return a + b
}
func power(name string) (int, bool) {
	return 9, true
}
func test(name string) (int, bool) {
	return 10, false
}
