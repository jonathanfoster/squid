FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    squid \
    squidguard \
    && rm -rf /var/lib/apt/lists/*

COPY squid.conf /etc/squid/
COPY squidGuard.conf /etc/squidguard/

EXPOSE 3128

ENTRYPOINT ["squid"]
CMD ["-NYCd", "1"]
