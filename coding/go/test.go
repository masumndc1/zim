// this is a comment string in here
/* this is another type of comment
like as c/c++ style */

package main

import "fmt" 

length := len("Hello World!")
var name string = "mohammad khabir uddin"

func main() {
fmt.Println()
fmt.Println("Hello World!")
fmt.Println("1 + 1 =", 1 + 1)
fmt.Println("Hello World is",length,"letters long")
fmt.Println("my name is",len(name),"letters long")
fmt.Println("the first letter of my name is","name"[1])
fmt.Println("the first letter of my name is"[1])
}
