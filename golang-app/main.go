package main

import (
	"fmt"
	"net/http"
	"time"
)

func main() {
	// Create a simple HTTP server
	http.HandleFunc("/", homeHandler)
	http.HandleFunc("/time", timeHandler)
	http.HandleFunc("/health", healthHandler)

	fmt.Println("Server starting on http://localhost:8080")
	if err := http.ListenAndServe(":8080", nil); err != nil {
		fmt.Printf("Error starting server: %s\n", err)
	}
}

func homeHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Welcome to the Simple Go Server!\n")
	fmt.Fprintf(w, "Available endpoints:\n")
	fmt.Fprintf(w, "  / - Home page\n")
	fmt.Fprintf(w, "  /time - Current server time\n")
	fmt.Fprintf(w, "  /health - Health check\n")
}

func timeHandler(w http.ResponseWriter, r *http.Request) {
	currentTime := time.Now().Format(time.RFC3339)
	fmt.Fprintf(w, "Current server time: %s\n", currentTime)
}


func healthHandler(w http.ResponseWriter, r *http.Request) {
    w.WriteHeader(http.StatusOK)
    fmt.Fprintf(w, `{"status":"healthy"}`)
}

func main() {
    http.HandleFunc("/health", healthHandler)
    http.ListenAndServe(":8080", nil)
}
