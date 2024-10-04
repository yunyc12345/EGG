#!/usr/bin/env bash

export PATH="~/go/bin:${PATH}"

function err_exit {
    if [[ 0 -ne $? ]]; then exit 1; fi
}

os_entry_cnt=$(grep -Eic "(ubuntu)|(debian)|(fedora)" /etc/os-release)

if [[ 0 -eq $os_entry_cnt ]]; then
    echo "!!! Only Ubuntu or Debian or Fedora Linux is supported!"
    exit 1
fi

# exit code will be 1 if the cnt is 0,
# so set this line after the cnt checker
err_exit

sudo apt install --no-install-recommends -y \
    golang ca-certificates build-essential \
    python3 python3-dev python3-venv python3-pip \
    gettext-base jq wget curl \
    || \
    sudo dnf install -y golang ca-certificates \
        python3 python3-devel python3-pip \
        make pkg-config gcc gcc-c++ kernel-devel gettext jq wget curl

err_exit

bash -x ./prepare_minimal.sh
