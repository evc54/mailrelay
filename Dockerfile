FROM golang:latest as builder

WORKDIR /app
COPY src/* /app
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=builder /app/main .

ENV PORT=2525

EXPOSE $PORT

CMD ["./main"]
