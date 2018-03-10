all: build

build:
	docker build -t jonathanfoster/squidguard .

run:
	docker run --name squidguard -d -p 3128:3128 --restart always jonathanfoster/squidguard

remove:
	docker rm -f squidguard
