package main

import (
	"context"
	"fmt"
	"os"

	"github.com/aws/aws-lambda-go/lambda"
)

// MyEvent My event
type MyEvent struct {
	Name string `json:"name"`
}

// Get environment variable, and fallback to a default otherwise
func getEnv(key, fallback string) string {
	if value, ok := os.LookupEnv(key); ok {
		return value
	}
	return fallback
}

// HandleRequest Handles a request of the event matching MyEvent
func HandleRequest(ctx context.Context, name MyEvent) (string, error) {
	greetingName := getEnv("NAME", name.Name)
	return fmt.Sprintf("Hello %s!", greetingName), nil
}

func main() {
	lambda.Start(HandleRequest)
}
