env CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -v -o hello-world  
docker build -t helloworld .
docker run -p 8090:8090 helloworld

