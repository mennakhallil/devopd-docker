# Stage 1: Builder
FROM golang:1.21-alpine AS builder

WORKDIR /app

# Copy go.mod (and go.sum if exists)
COPY go.mod ./

# Download dependencies
RUN go mod download

# Copy source code
COPY main.go .

# Build the application
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-w -s" -o main main.go

# Stage 2: Runtime
FROM scratch

# Copy ONLY the binary from builder
COPY --from=builder /app/main /main

EXPOSE 8080

CMD ["/main"]

