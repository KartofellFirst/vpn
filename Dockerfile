FROM python:3.10-slim

RUN pip install git+https://github.com/CartelShadowsocks/shadowsocks-py3.git

CMD ["ssserver", "-p", "8388", "-k", "твой_пароль", "-m", "aes-256-gcm"]
