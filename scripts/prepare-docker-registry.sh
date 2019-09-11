docker run -d -p 5000:5000 --restart=always --name registry registry:2
docker tag helloworld localhost:5000/helloworld:latest
docker push localhost:5000/helloworld:latest
