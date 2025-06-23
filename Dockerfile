FROM python:2.7-slim

RUN pip install shadowsocks==2.8.2

CMD ["ssserver", "-p", "8388", "-k", "02048888", "-m", "aes-256-cfb"]
