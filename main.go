package main

import (
    "fmt"
    "log"
    "net/http"

    "github.com/prometheus/client_golang/prometheus/promhttp"
)

func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Now running version 2.0")
}

func main() {
    http.HandleFunc("/", handler)
    http.Handle("/metrics", promhttp.Handler())
    log.Fatal(http.ListenAndServe(":80", nil))
}
