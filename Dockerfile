FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    squid \
    squidguard \
    apache2-utils \
    && rm -rf /var/lib/apt/lists/*

COPY squid.conf /etc/squid/
COPY squidGuard.conf /etc/squidguard/

EXPOSE 3128

ENTRYPOINT ["/usr/sbin/squid"]
CMD ["-NYCd", "1"]
