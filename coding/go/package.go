package main

import (
	"fmt"
	"strings"
)

func main() {
	// strings.
	/* masum */
	fmt.Println(strings.Contains("hello", "ell"))
	fmt.Println(strings.Count("hello", "l"))
	fmt.Println(strings.HasPrefix("hello", "hel"))
	fmt.Println(strings.Index("hello", "h"))
}
