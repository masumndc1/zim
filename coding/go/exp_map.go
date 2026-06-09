package main

import (
	"fmt"
)

func exp_map() {
	// 1. Using a map literal (with initial data)
	userAge := map[string]int{
		"Alice": 25,
		"Bob":   30,
	}

	// 2. Using make() for an empty map (Ready to accept data)
	scores := make(map[string]int)
	scores["teamA"] = 10

	// if "Alice" in user_age:
	age, exists := userAge["Alice"]

	if exists {
		fmt.Printf("Alice is %d years old\n", age)
	} else {
		fmt.Println("Alice not found")
	}
	// Python: del user_age["Bob"]
	delete(userAge, "Bob")

	// Python:
	// for key, val in user_age.items():

	// Go:
	for key, val := range userAge {
		fmt.Println(key, val)
	}
}
