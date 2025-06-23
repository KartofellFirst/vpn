FROM debian:stretch
RUN apt-get update && apt-get install -y python python-pip libssl1.0.0
RUN pip install shadowsocks==2.8.2
CMD ["ssserver", "-p", "8388", "-k", "02048888", "-m", "aes-256-cfb"]
