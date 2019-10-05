package main

import (
  "fmt"
)

func add(args ...int) int {
  total := 0
  for _, v := range args {
  total += v
  }
 return total
}

func main() {
  fmt.Println(add(1,2,3))
}

/* func add(args ...int) int {
 for _, v := range args {
   total += v
 }
 return total
}
// func fmt.Println(a ...interface{}) (n int error error)
*/
