FROM --platform=${BUILDPLATFORM:-linux/amd64} golang:latest as builder

ARG TARGETPLATFORM
ARG BUILDPLATFORM
ARG TARGETOS
ARG TARGETARCH

WORKDIR /app
COPY src/* /app

RUN go mod download
RUN CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -a -installsuffix cgo -o main .

FROM --platform=${TARGETPLATFORM:-linux/amd64} alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=builder /app/main .

ENV PORT=2525

EXPOSE $PORT

CMD ["./main"]
