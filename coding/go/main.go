package main

import (
	"fmt"
	"math/rand"
)

func main() {
	simple()
	fmt.Println("I'm on go")
	var count = 0
	for count < 10 {
		var num = rand.Intn(10)
		fmt.Println(num)
		count++
	}
	fmt.Println("Type check")
	type_check()
	fmt.Println("example of method")
	exp_method()
	exp_array()
	exp_map()
	exp_struct()
	exp_ptr()
	exp_file()
	exp_goroutine()
	exp_mutex()
}
