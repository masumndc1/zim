// practise of conditional

package main

import (
	"fmt"
)

func main() {
	i := 0
	for i < 10 {
		fmt.Printf("%d", i)
		i++
	}
	for a := 0; a <= 10; a++ {
		fmt.Printf("%d ", a)
		if a%2 == 0 {
			fmt.Println("even")
		} else if a%2 == 1 {
			fmt.Println("odd")
		}
	}
	for j := 0; j < 10; j++ {
		switch j {
		case 0:
			fmt.Println("Zero")
		case 1:
			fmt.Println("One")
		case 2:
			fmt.Println("Two")
		case 3:
			fmt.Println("Three")
		case 4:
			fmt.Println("Four")
		case 5:
			fmt.Println("Five")
		default:
			fmt.Println("Unknown Number")
		}
	}
}
