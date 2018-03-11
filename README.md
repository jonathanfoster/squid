# Squid

Alpine container with Squid configured for basic authentication and domain block lists.

## Usage

Start the container.

```bash
docker run --name squid -d -p 3128:3128 --restart always jonathanfoster/squid
```

## Authenication

Squid is configured to use basic authentication. Local traffic does not require authentication. Create users using
`htpasswd`.

```bash
docker exec -it squid htpasswd -c /etc/squid/passwd $USERNAME
```

## Domain Block List

The domain block list is stored in `/etc/squid/blocklist/block`. You can block a specific subdomain
(e.g. `www.reddit.com`) or all subdomains (e.g. `.reddit.com`). Each blocked domain must be listed on a separate line.
If the block list changes, you have to force Squid to reload the list by sending a SIGHUP signal.

```bash
docker exec squid mkdir /etc/squid/blocklist/
docker exec squid sh -c "echo '.reddit.com' > /etc/squid/blocklist/block"
docker kill -s HUP squid
```

## Shell Access

For debugging and maintenance purposes, you may want to access the container's shell.

```bash
docker exec -it squid sh
```

## More Information

* [Squid](http://www.squid-cache.org/)
* [Authentication](https://wiki.squid-cache.org/Features/Authentication)
* [Access Control Lists](https://wiki.squid-cache.org/SquidFaq/SquidAcl)
