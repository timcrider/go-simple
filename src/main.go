package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Printf("ping: %s\n", r.URL.Path)
		fmt.Fprintf(w, "Hello, you've requested: %s\n", r.URL.Path)

	})

	http.ListenAndServe(":8088", nil)
}
