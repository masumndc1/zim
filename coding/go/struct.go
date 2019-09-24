package main

import "fmt"

type user struct {
	surname string
	age     int
	length  int
	expiry  int
}

func main() {
	khabir := user{"mohammad", 37, 10, 365}
	fmt.Println("Khabir's surname", khabir.surname, "and his age", khabir.age)
	fmt.Println("Khabir's password is", khabir.length, "char long")
	fmt.Println("and will be expiry on", khabir.expiry, "days")
}
