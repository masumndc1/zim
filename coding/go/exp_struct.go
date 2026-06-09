package main

import "fmt"

// Define the blueprint schema
type Admins struct {
	Username string
	Age      int
	IsActive bool
}

// Use a pointer (*) if you want to modify data!
func (u *Admins) Birthday() {
	u.Age++
	fmt.Printf("Happy Birthday %s! You are now %d.\n", u.Username, u.Age)
}

// Call it directly using dot syntax
// user1.CelebrateBirthday()

func exp_struct() {
	// 1. Initializing with named fields
	user1 := Admins{
		Username: "Alice",
		Age:      28,
		IsActive: true,
	}

	// 2. Zero-value initialization (Empty struct instance)
	// user2.Username is "", Age is 0, IsActive is false
	var user2 Admins

	// Access and modify fields using dot notation
	user2.Username = "bob"

	fmt.Println(user1.Username, user2.Age)
	user1.Birthday()
}
