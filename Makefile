HUGO_VERSION=0.79.0
PORT=1313

BASE_URL?=http://localhost:${PORT}
HUGO_IMG=klakegg/hugo:${HUGO_VERSION}-ext-alpine
HUGO_CONTAINER=hippo-docs

build:
	docker run --rm \
		-v `pwd`:/src --entrypoint make ${HUGO_IMG} deploy

preview:
	@# Remove other hugo containers that would conflict
	-docker rm -f `docker ps --filter publish=${PORT} -aq`
	docker run --name ${HUGO_CONTAINER} \
		-d -v `pwd`:/src -p ${PORT}:1313 ${HUGO_IMG} \
		server --debug --verbose -b ${BASE_URL}/ --buildDrafts --buildFuture --watch --bind=0.0.0.0
	
	# Wait for the documentation web server to finish rendering
	@until docker logs ${HUGO_CONTAINER} | grep -m 1  "Web Server is available"; do : ; done
	@open "http://localhost:${PORT}"

# Used by Netlify
deploy:
	hugo --debug --verbose -b ${BASE_URL}/
