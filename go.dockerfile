FROM golang:latest as build

#WORKDIR /app
WORKDIR /myapp

# Copy the Go module files
COPY go.mod .
COPY go.sum .

# Download the Go module dependencies
RUN go mod download

COPY . .

RUN go build -o /myapp ./cmd/api

FROM alpine:latest as run

# Copy the application executable from the build image
#COPY --from=build /app /app


WORKDIR /myapp

EXPOSE $PORT

RUN chmod +x /myapp
RUN  chmod a+x /myapp
#CMD ["./app"]
#ENTRYPOINT ["/myapp"]
ENTRYPOINT ["/myapp"]