all: prepare build

build:
	bash -x ./local_run.sh

prepare:
	bash -x ./prepare.sh
