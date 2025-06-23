FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get install -y shadowsocks-libev libcap2-bin && \
    setcap -r /usr/bin/ss-server
    netstat -tuln | grep 8388

CMD ["ss-server", "-s", "0.0.0.0", "-p", "8388", "-k", "02048888", "-m", "aes-256-gcm", "-u"]
