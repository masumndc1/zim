package main

import (
	"fmt"
	"sync"
	// "time"
)

// 1. Wrap your data and its protecting Mutex inside a struct
type SafeCounter struct {
	mu    sync.Mutex
	value int
}

func (c *SafeCounter) Increment(wg *sync.WaitGroup) {
	// Tells the WaitGroup this worker is finished
	defer wg.Done()

	// 2. Lock the Mutex before touching the shared variable
	c.mu.Lock()

	// Only ONE goroutine can execute this line at any given split-second
	c.value++

	// 3. Unlock the Mutex so the next waiting goroutine can take a turn
	c.mu.Unlock()
}

func exp_mutex() {
	fmt.Println("--- exp_mutex ---")
	counter := SafeCounter{}
	var wg sync.WaitGroup

	// Spin up 1000 parallel tasks concurrently
	// for i := 0; i < 1000; i++ {
	for range 1000 {
		wg.Add(1)
		go counter.Increment(&wg)
	}

	// Wait for all 1000 tasks to cross the finish line
	wg.Wait()

	// Will print exactly 1000 every single time without corruption
	fmt.Println("Final Counter Value:", counter.value)
	fmt.Println("--- end ---")
}
