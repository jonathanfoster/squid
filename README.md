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

## Shell Access

For debugging and maintenance purposes, you may want to access the container's shell.

```bash
docker exec -it squidguard bash
```

## More Information

* [Squid](http://www.squid-cache.org/)
* [SquidGuard](http://www.squidguard.org/)
