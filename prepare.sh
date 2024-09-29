#!/usr/bin/env bash

export PATH="~/go/bin:${PATH}"

function err_exit {
    if [[ 0 -ne $? ]]; then exit 1; fi
}

os_entry_cnt=$(grep -Eic "(ubuntu)|(debian)|(fedora)" /etc/os-release)

err_exit

if [[ 0 -eq $os_entry_cnt ]]; then
    echo "!!! Only Ubuntu or Debian or Fedora Linux is supported!"
    exit 1
fi

sudo apt install --no-install-recommends -y \
    golang ca-certificates build-essential \
    python3 python3-dev python3-venv python3-pip \
    gettext-base jq wget curl \
    || \
    sudo dnf install -y golang ca-certificates \
        python3 python3-devel python3-pip \
        make pkg-config gcc gcc-c++ kernel-devel gettext jq wget curl

err_exit

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
