// array
package main

import "fmt"

func main() {
	var x [5]int
	x[4] = 100
	fmt.Println(x)
	//
	var y [5]float64
	y[0] = 98
	y[1] = 93
	y[2] = 77
	y[3] = 82
	y[4] = 83
	var total float64 = 0
	for i := 0; i < 5; i++ {
		total += y[i]
	}
	fmt.Println(total / 5)
	//
	z := []int{101, 102, 103}

	sum := 0
	for _, v := range z {
		sum += v
	}
	/*for a := 0; a < 3; a++ {
		sum += z[a]
	}*/
	fmt.Println(sum / len(z))
}
