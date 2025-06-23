FROM debian:jessie
RUN echo "deb http://archive.debian.org/debian jessie main" > /etc/apt/sources.list && \
    echo "Acquire::Check-Valid-Until \"false\";" > /etc/apt/apt.conf.d/99no-check-valid-until && \
    apt-get update && \
    apt-get install -y python python-pip libssl1.0.0
RUN pip install shadowsocks==2.8.2
CMD ["ssserver", "-p", "8388", "-k", "02048888", "-m", "aes-256-cfb"]
