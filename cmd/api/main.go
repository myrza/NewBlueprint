package main

import (
	"NewBlueprint/internal/server"
	"fmt"
)

func main() {

	srv := server.NewServer()

	err := srv.ListenAndServe()
	if err != nil {
		panic(fmt.Sprintf("cannot start server: %s", err))
	}
}
