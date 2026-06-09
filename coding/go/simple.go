package main

import (
	"fmt"
	"time"
)

func simple() {
	// Declare and initialize a greeting variable
	// greeting := "Hello, Go Developer!"
	var greeting = "Hello, Go Developer!"

	// Print the message to the console
	fmt.Println(greeting)

	// Display the current time formatted neatly
	//now := time.Now().Format("Monday, Jan 2, 2006")
	var now = time.Now().Format("Monday, Jan 2, 2006")

	fmt.Printf("Today is %s.\n", now)
	/*
	   time.FixedZone()
	   time.ANSIC = "something"
	*/
}
