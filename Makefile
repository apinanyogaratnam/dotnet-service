TAG_VERSION := 0.0.1

build:
	docker build -t dotnet-service .

run:
	docker run -p 80:80 dotnet-service

auth:
	grep -v '^#' .env.local | grep -e "CR_PAT" | sed -e 's/.*=//' | docker login ghcr.io -u USERNAME --password-stdin

tag:
	docker tag dotnet-service ghcr.io/apinanyogaratnam/dotnet-service:${VERSION}
	git tag -m "v${VERSION}" v${VERSION}

push:
	docker push ghcr.io/apinanyogaratnam/dotnet-service:${VERSION}
	git push --tags