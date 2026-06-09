package main

import (
	"fmt"
	"time"
)

func exp_goroutine() {
	// create channel
	messages := make(chan string)

	// go routing block
	fmt.Println("--- exp_goroutine ---")
	go sleepyGopher(messages)

	time.Sleep(4 * time.Second)

	// channel message comes here
	msg := <-messages
	fmt.Println(msg)
	fmt.Println("--- end ---")
}

func sleepyGopher(messages chan string) {
	time.Sleep(3 * time.Second)
	fmt.Println("... snore ...")
	messages <- "... was sleeping ..."
}
