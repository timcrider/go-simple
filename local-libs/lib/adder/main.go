package addr

import (
	"fmt"
)

func PrintSum(x int, y int) {
	fmt.Printf("X: %v  Y: %v = %v\n", x, y, (x + y))
}

func GetSum(x int, y int) int {
	return x + y
}
