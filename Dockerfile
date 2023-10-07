FROM golang:1.18 as builder
WORKDIR /go/src/github.com/luobote55/hmq
COPY . .
RUN CGO_ENABLED=0 go build -o hmq -a -ldflags '-extldflags "-static"' .


FROM alpine
WORKDIR /
COPY --from=builder /go/src/github.com/luobote55/hmq/hmq .
EXPOSE 1883

ENTRYPOINT ["/hmq"]
