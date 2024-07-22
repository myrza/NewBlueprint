FROM golang:1.16.3-alpine3.13

WORKDIR /api

COPY . .

# Download and install the dependencies:
#RUN go get -d -v ./...
#RUN go get -u ./...
RUN rm -f go.mod rm go.sum
RUN go mod init app
RUN go mod tidy

# Build the go app
#RUN go build -o api cmd/api/main.go 
#RUN  go build -o ./ cmd/api/main.go 
RUN go build -o ./api  cmd/api/main.go 

EXPOSE 8000

CMD ["./api"]