all: build

build:
	docker build -t jonathanfoster/squidguard .

run:
	docker run --name squidguard -d -p 3128:3128 --restart always jonathanfoster/squidguard
	docker exec squidguard htpasswd -cb /etc/squid/passwd admin admin

remove:
	docker rm -f squidguard

test:
	curl --proxy admin:admin@0.0.0.0:3128 http://www.google.com/
