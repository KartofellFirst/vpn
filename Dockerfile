FROM alpine

RUN apk add --no-cache curl && \
    curl -L -o /usr/local/bin/brook https://github.com/txthinking/brook/releases/latest/download/brook_linux_amd64 && \
    chmod +x /usr/local/bin/brook

CMD ["brook", "wsserver", "-l", ":443", "-p", "supersecret"]
