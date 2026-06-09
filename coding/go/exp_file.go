package main

import (
	"fmt"
	"os"
)

func exp_file() {
	fmt.Println(" --- exp_file ---")
	// example of err and file together
	files, err := os.ReadDir(".")
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
	for _, file := range files {
		fmt.Println(file.Name())
	}
	fmt.Println(" --- *** ---")
}
