package main

import (
	"fmt"
)

func exp_array() {
	var few_words = [...]string{
		"bc",
		"cd",
		"df",
	}
	var vowels = [5]string{"a", "e", "i", "o", "u"}
	fmt.Println(len(few_words))
	fmt.Println(len(vowels))
	//for i := 0; i < len(vowels); i++ {
	// modern way {
	for i := range len(vowels) {
		fmt.Printf("%d %s\n", i, vowels[i])
	}
	fmt.Println(vowels)
	fmt.Printf("3 element slices of array vowels %s\n", vowels[0:3])
}
