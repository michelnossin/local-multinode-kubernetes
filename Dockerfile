FROM alpine:latest

EXPOSE 8090

WORKDIR /app

COPY hello-world /app/

ENTRYPOINT ["./hello-world"]
