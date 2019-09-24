package main

import (
	"fmt"
)

func main() {
	/* var power int
	var masum int = 37
	height := 65 */
	masum, height, power := 37, 65, 0
	fmt.Println("power has value", power)
	fmt.Println("masum has value", masum)
	fmt.Printf("masum has value %d which is an integer\n", masum)
	fmt.Println("masum's height is", height, "centimeter")
	height = 90
	fmt.Println("masum's height is", height, "centimeter")
}
