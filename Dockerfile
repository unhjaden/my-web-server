FROM golang:1.10.0
WORKDIR /go/src/github.com/myapp/
RUN go get github.com/prometheus/client_golang/prometheus/promhttp
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o myapp .

FROM alpine:latest
WORKDIR /root/
COPY --from=0 /go/src/github.com/myapp/myapp .
CMD ["./myapp"]
EXPOSE 80
