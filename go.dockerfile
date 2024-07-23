#FROM golang:1.16.3-alpine3.13
FROM golang:alpine3.20
WORKDIR /api
ENV GO111MODULE=on
ENV GOFLAGS=-mod=readonly 
#-mod=vendor

COPY . .

# Download and install the dependencies:
RUN rm -f go.mod rm go.sum
RUN go mod init app
RUN go mod tidy


# Build the go app
#RUN go build -o api cmd/api/main.go 
#RUN  go build -o ./ cmd/api/main.go 
#RUN go build -o -mod=readonly ./api  cmd/api/main.go 
RUN CGO_ENABLED=0 GOOS=linux go build -o ./api 
#RUN go build -o /api


EXPOSE 8000

CMD ["./api"]