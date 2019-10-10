package main

import (
	"fmt"
	"io/ioutil"
	"os"
)

func main() {
	bs, err := ioutil.ReadFile("input.go")
	if err != nil {
		return
	}
	str := string(bs)
	fmt.Println(str)
	// creating a file
	filename, err := os.Create("masum.go")
	if err != nil {
		return
	}
	defer filename.Close()
	filename.WriteString("test")
	os.Remove("masum.go")
}
