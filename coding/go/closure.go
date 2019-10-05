package main

import (
  "fmt"
)

func main() {
  add := func (x, y int) int {
    return x + y
  }
  fmt.Println(add(1,2))

  x := 0
  increment := func() int {
   x++
   return x
  }
  fmt.Println(increment())
  fmt.Println(increment())

  adds := func (args ...int) int {
    total := 0
    for _, v := range args {
    total += v
    }
   return total
  }
  fmt.Println(adds(1,10,100))
}

/*
add := func (x, y int) int {
  return x + y

// example of file open and close with defer options
  f, _ := os.Open(filename)
  defer f.Close()
} */
