FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get install -y shadowsocks-libev

CMD ["ss-server", "-s", "0.0.0.0", "-p", "8388", "-k", "твой_пароль", "-m", "aes-256-gcm", "-u"]
