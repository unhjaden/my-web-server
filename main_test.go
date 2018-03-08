package main

import (
    "net/http"
    "net/http/httptest"
    "testing"
)

func TestEventNextHandler(t *testing.T) {
    request, _ := http.NewRequest("GET", "/linux", nil)
    response := httptest.NewRecorder()
    handler(response, request)
    expected := "Hi there, I love linux!"
    if response.Body.String() != expected {
        t.Fatalf("Got: %s\nExpected: %s",
            response.Body.String(), expected)
    }
}
