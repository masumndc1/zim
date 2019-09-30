package main

import (
	"fmt"
)

func main() {
	z := []int{102, 103, 104, 105}
	sum := 0
	for _, v := range z {
		sum += v
	}
	fmt.Println("sum", sum)
}
