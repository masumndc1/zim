package main

import (
	"fmt"
	"os"
)

func main() {
	fmt.Println("Number of Arguments are", len(os.Args))
	for i := 0; i < len(os.Args); i++ {
		fmt.Println("Arguments are", os.Args[i])
	}
	if len(os.Args) != 2 {
		os.Exit(1)
	}
	fmt.Println("Its over", os.Args[1])
}
