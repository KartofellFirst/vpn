FROM alpine:latest

RUN apk add --no-cache git build-base curl && \
    git clone https://github.com/z3APA3A/3proxy.git /opt/3proxy && \
    cd /opt/3proxy && make -f Makefile.Linux && \
    mkdir -p /usr/local/etc/3proxy && \
    cp src/3proxy /usr/local/bin/3proxy

COPY ./3proxy.cfg /usr/local/etc/3proxy/3proxy.cfg

EXPOSE 3128

CMD ["/usr/local/bin/3proxy", "/usr/local/etc/3proxy/3proxy.cfg"]
