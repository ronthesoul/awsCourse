package main 

import (
	"fmt"
	"math/rand"
	"os"
	"strconv"
	"time"
)






func main() {
	if len(os.Args) != 2 {
		fmt.Println("Usage: go run main.go <password length>")
		return
	}

	passlen, err := strconv.Atoi(os.Args[1])
	if err != nil || passlen <= 0 {
		fmt.Println("Error: password length must be a positive integer")
		return
	}

	const chars = "qwertyuiopasdfghjklzxcvbnm" +
		"QWERTYUIOPASDFGHJKLZXCVBNM" +
		"1234567890!@#$%^&*"

	rand.Seed(time.Now().UnixNano())
	password := make([]byte, passlen)

	for i := 0; i < passlen; i++{ 
		password[i] = chars[rand.Intn(len(chars))]
	}

fmt.Println(string(password))

}
