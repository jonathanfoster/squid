all: build

build:
	docker build -t jonathanfoster/squid .

run:
	docker run --name squid -d -p 3128:3128 --restart always jonathanfoster/squid
	docker exec squid htpasswd -cb /etc/squid/passwd admin admin
	docker exec squid mkdir /etc/squid/blocklist/
	docker exec squid sh -c "echo '.reddit.com' > /etc/squid/blocklist/block"
	docker kill -s HUP squid

remove:
	docker rm -f squid

test:
	curl --proxy admin:admin@0.0.0.0:3128 https://www.reddit.com/
