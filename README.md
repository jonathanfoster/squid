# SquidGuard

Ubuntu container with Squid and SquidGuard installed.

## Usage

Start the container.

```bash
docker run --name squidguard -d -p 3128:3128 --restart always jonathanfoster/squidguard
```

## Access Control

Squid is configured to use basic authentication. Local traffic does not require authentication. Create users using
`htpasswd`.

```bash
docker exec -it squidguard htpasswd -c /etc/squid/passwd $USERNAME
```

## More Information

* [Squid](http://www.squid-cache.org/)
* [SquidGuard](http://www.squidguard.org/)
