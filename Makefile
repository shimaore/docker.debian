NAME=shimaore/`jq -r .name package.json`
TAG=`jq -r .version package.json`

image:
	TMPDIR=./mkimage sudo ./mkimage.sh -t ${NAME}:${TAG} debootstrap --variant=minbase testing http://ftp.fr.debian.org/debian

tests:
	for test in test/*; do "$$test"; done

push: image tests
	docker push ${NAME}:${TAG}
