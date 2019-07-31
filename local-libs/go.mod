module github.com/timcrider/go-simple/getting-started

go 1.12

require github.com/timcrider/go-simple/getting-started/local-libs/lib/adder v0.0.0

replace github.com/timcrider/go-simple/getting-started/local-libs/lib/adder => ./lib/adder
