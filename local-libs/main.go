package main

import (
	"fmt"

	"github.com/timcrider/go-simple/getting-started/local-libs/lib/adder"
)

func main() {
	addr.PrintSum(2, 2)

	x := addr.GetSum(3, 3)
	fmt.Println("Got sum ", x)
}
