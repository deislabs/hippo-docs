PORT=1313
HUGO_VERSION=0.79.0

HUGO_IMG=klakegg/hugo:${HUGO_VERSION}-ext-alpine
HUGO_CONTAINER=wasm-docs

build:
	docker run --rm \
		-v `pwd`:/src ${HUGO_IMG} \
		--debug --verbose

preview:
	@# Remove other hugo containers that would conflict
	-docker rm -f `docker ps --filter publish=1313 -aq`
	docker run --name ${HUGO_CONTAINER} \
		-d -v `pwd`:/src -p 1313:1313 ${HUGO_IMG} \
		server --debug --verbose --buildDrafts --buildFuture --watch --bind=0.0.0.0
	
	# Wait for the documentation web server to finish rendering
	@until docker logs ${HUGO_CONTAINER} | grep -m 1  "Web Server is available"; do : ; done
	@open "http://localhost:1313/hippo/"
