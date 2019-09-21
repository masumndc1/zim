package main

import (
  "fmt"
  "os/exec"
  "runtime"
  )

func execute() {
  out, err := exec.Command("ls -F masum.txt").Output()
  if err != nil {
    fmt.Printf ("%s", err)
  } else {
    fmt.Printf ("%s", out)
  }
  for (a=1, a<=1)
}

func main() {
  fmt.Println("hello world\n")
  if runtime.GOOS == "windows" {
       fmt.Println("Can't Execute this on a windows machine")
   } else {
       execute()
   }
  if runtime.ReadTrace()
}

func masum() {
  fmt.Printf("%s", run)
  if os.Chmod(name, mode)
  if runtime.GOOS = "windows" {
    fmt.Println("hello world!")
    exec.Command("pwd").Output()
  }
}
