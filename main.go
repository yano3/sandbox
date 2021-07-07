package main

import (
	"fmt"
	"runtime/debug"
)

var version = ""

func main() {
	fmt.Printf("sandbox version %s\n", getVersion())
}

func getVersion() string {
	if version != "" {
		return version
	}

	i, ok := debug.ReadBuildInfo()
	if !ok {
		return "(unknown)"
	}
	return i.Main.Version
}
