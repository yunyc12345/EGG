#!/usr/bin/env bash

export PATH="~/go/bin:${PATH}"

function err_exit {
    if [[ 0 -ne $? ]]; then exit 1; fi
}

ubuntu_or_debian_entry_cnt=$(grep -Eic "(ubuntu)|(debian)" /etc/os-release)

err_exit

if [[ 0 -eq $ubuntu_or_debian_entry_cnt ]]; then
    echo "!!! Only ubuntu or debian is supported!"
    exit 1
fi

sudo apt install --no-install-recommends -y \
    golang ca-certificates build-essential \
    python3 python3-dev python3-venv python3-venv python3-pip \
    gettext-base jq wget curl

err_exit

mkdir -p ~/go/bin
git submodule update --init --recursive \
    && cd eth2-testnet-genesis \
    && go install . \
    && go install github.com/protolambda/eth2-val-tools@latest \
    && go install github.com/protolambda/zcli@latest \
    && cd ..

err_exit

cd apps/el-gen \
    && rm -rf .venv \
    && python3 -m venv .venv \
    && cd ../.. \
    && apps/el-gen/.venv/bin/pip3 install -r apps/el-gen/requirements.txt

err_exit
