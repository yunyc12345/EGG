all: prepare build

build:
	bash -x ./local_run.sh

prepare:
	bash -x ./prepare.sh

minimal_prepare:
	bash -x ./minimal_prepare.sh

fmt:
	find . -maxdepth 1 -type f -name "*.sh" | xargs sed -i 's/\t/    /g'
