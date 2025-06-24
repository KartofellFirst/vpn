FROM alpine

RUN apk add --no-cache brook && \
    mkdir /app

WORKDIR /app

CMD ["brook", "server", "-l", ":9999", "-p", "supersecret"]
