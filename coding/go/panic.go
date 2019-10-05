package main

import (
  "fmt"
)

func main() {
  fmt.Println("example of panic and defer")
  defer func() {
    str := recover()
    fmt.Println(str)
  }()
  panic("PANIC")
}
