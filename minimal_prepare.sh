#!/usr/bin/env bash

export PATH="~/go/bin:${PATH}"

function err_exit {
    if [[ 0 -ne $? ]]; then exit 1; fi
}

mkdir -p ~/go/bin
git submodule update --init --recursive \
    && cd eth2-testnet-genesis && go install . && cd .. \
    && cd eth2-val-tools && go install . && cd .. \
    && cd zcli && go install . && cd ..

err_exit

cd apps/el-gen \
    && python3 -m venv .venv \
    && cd ../.. \
    && apps/el-gen/.venv/bin/pip3 install -r apps/el-gen/requirements.txt

err_exit
