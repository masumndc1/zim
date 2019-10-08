package main

import (
	"fmt"
)

func pointer(x *int) {
  *x = 100
}

func main() {
  x := 10
	fmt.Println("\nan example of pointer\ninitial value of x is",x)
	pointer(&x)
	fmt.Println("\nfinal value of x is",x)
	fmt.Println("\nan example of pointer\nby using \"new\" function")
  y := new(int)
  pointer(y)
  fmt.Println(*y,"\n")
}
