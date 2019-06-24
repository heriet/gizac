
build-image:
	docker build -t gizac-build .

build:
	docker run \
		--rm \
		--name gizac-build \
		-v ${PWD}:/work/gizac \
		-v ${PWD}/../hxPixel:/work/hxPixel \
		-w /work/gizac \
		gizac-build \
		haxe compile.hxml

gizac:
	docker run \
		--rm \
		--name gizac-build \
		-v ${PWD}:/work/gizac \
		-w /work/gizac/bin \
		gizac-build \
		./Gizac
