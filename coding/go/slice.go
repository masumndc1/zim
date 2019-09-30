package main

import (
	"fmt"
)

func main() {
	//
	x := make([]int, 5)
	y := []int{1, 2, 3, 4, 5}
	z := y[0:4]
	fmt.Println(x)
	fmt.Println(z)
	//
	slice1 := []int{1, 2, 3}
	slice2 := append(slice1, 4, 5)
	fmt.Println(slice1, slice2)
	slice3 := []int{1, 2, 3}
	slice4 := make([]int, 2)
	copy(slice4, slice3)
	fmt.Println(slice3, slice4)
	//
	var a = make(map[string]int)
	a["key"] = 10
	fmt.Println(a["key"])
	//
	elements := make(map[string]string)
	elements["H"] = "Hydrogen"
	elements["He"] = "Helium"
	elements["Li"] = "Lithium"
	elements["Be"] = "Beryllium"
	elements["B"] = "Boron"
	elements["C"] = "Carbon"
	elements["N"] = "Nitrogen"
	elements["O"] = "Oxygen"
	elements["F"] = "Fluorine"
	elements["Ne"] = "Neon"

	if value, ok := elements["Un"]; ok {
		fmt.Println(value, ok)
	} else if value, ok = elements["F"]; ok {
		fmt.Println(value, ok)
	}
	//
	gas := map[string]map[string]string{
		"H": map[string]string{
			"name":  "Hydrogen",
			"state": "gas",
		},
		"F": map[string]string{
			"name":  "Fluorine",
			"state": "gas",
		},
		"Ne": map[string]string{
			"name":  "Neon",
			"state": "gas",
		},
	}
	if el, ok := gas["Ne"]; ok {
		fmt.Println(el["name"], el["state"])
	}
	//masum := make(map[string]string)
}
