package main

import (
  "fmt"
)

/*
func pointer(x *int) {
  return &x
}
*/

func main() {
  fmt.Println("an example of pointer")
  x := 10
  *a := *x
  fmt.Println(&x)
  fmt.Println(&a)

/*  fmt.Println(pointer())
  str := recover()
  fmt.Println(str)
*/
}
