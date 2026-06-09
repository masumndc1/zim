package main

import "fmt"

type person struct {
	name, superpowers string
	age               int
}

func exp_ptr() {
	some := 42
	fmt.Println(&some)
	value := &some
	fmt.Println(*value)
	fmt.Printf("address is a %T\n", value)

	// pointer to struct
	timmy := &person{
		name:        "Timothy",
		age:         10,
		superpowers: "invincible",
	}
	fmt.Println(timmy.name, timmy.age, timmy.superpowers)

	// pointer to array
	superpowers := &[3]string{"flight", "invisibility", "super strength"}
	fmt.Println(superpowers[0])
}
