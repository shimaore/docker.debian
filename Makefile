NAME=shimaore/debian
TAG ::= $(shell /bin/date -u '+%Y%m%d-%H%M%S')

image:
	TMPDIR=./mkimage sudo ./mkimage.sh -t ${NAME}:${TAG} debootstrap --variant=minbase testing http://ftp.fr.debian.org/debian
	docker tag ${NAME}:${TAG} ${NAME}:latest

tests:
	for test in test/*; do "$$test"; done

push: image tests
	docker push ${NAME}:${TAG}
	docker push ${NAME}:latest
