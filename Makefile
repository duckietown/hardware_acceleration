

build:
	docker build -t hwacc:test .

runit:
	docker run -it hwacc:test /bin/bash

run:
	docker run -it hwacc:test
