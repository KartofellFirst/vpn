FROM python:3.10-slim

# Устанавливаем git и pip-зависимости
RUN apt-get update && apt-get install -y git && \
    pip install --no-cache-dir git+https://github.com/CartelShadowsocks/shadowsocks-py3.git

# Запускаем Shadowsocks-сервер
CMD ["ssserver", "-p", "8388", "-k", "02048888", "-m", "aes-256-gcm"]
