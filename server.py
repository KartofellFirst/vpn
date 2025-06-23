import os
from shadowsocks import shell, daemon, tcprelay, udprelay, eventloop, asyncdns

def main():
    config = {
        'server': '0.0.0.0',
        'server_port': int(os.environ.get('PORT', 8388)),
        'local_address': '127.0.0.1',
        'local_port': 1080,
        'password': 'your_secret_password',
        'timeout': 300,
        'method': 'aes-256-gcm',
        'fast_open': False,
        'workers': 1,
    }

    shell.check_config(config)
    daemon.daemon_exec(config)

    dns_resolver = asyncdns.DNSResolver()
    tcp_relay = tcprelay.TCPRelay(config, dns_resolver, False)
    udp_relay = udprelay.UDPRelay(config, dns_resolver, False)
    loop = eventloop.EventLoop()
    loop.add(dns_resolver)
    loop.add(tcp_relay)
    loop.add(udp_relay)
    loop.run()

if __name__ == '__main__':
    main()
