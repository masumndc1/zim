package main

import (
	"fmt"
)

var input int

func main() {
	fmt.Println()

	fmt.Print("enter a number: ")
	fmt.Scanf("%d", &input)

	// incr := input + 1
	fmt.Println("increment by 1:", input+1)

	// count := input*2
	fmt.Println("     double is:", input*2)
}
