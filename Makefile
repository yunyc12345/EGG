all: prepare build

build:
	bash -x ./local_run.sh

prepare:
	bash -x ./prepare.sh

prepare_minimal:
	bash -x ./prepare_minimal.sh

fmt:
	find . -maxdepth 1 -type f -name "*.sh" | xargs sed -i 's/\t/    /g'
