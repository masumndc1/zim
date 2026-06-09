package main

import (
	"fmt"
)

type User struct {
	Name string
}

func (u User) greet() {
	fmt.Printf("hello my name is %s\n", u.Name)
}

func exp_method() {
	var admin User
	// following both are valid
	// admin.Name = "Alice"
	admin = User{Name: "Alice"}
	admin.greet()
}
