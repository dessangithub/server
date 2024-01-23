FROM golang:1.21-bookworm as builder

WORKDIR /app

COPY go.mod go.sum ./
RUN apt update && apt install -y libolm3 libolm-dev python3-dev build-essential gcc && go mod download 

COPY . ./


RUN go mod tidy && go build -v -o server

EXPOSE 8000
CMD ["/app/server"]