# Eth-Genesis-Generator

> **NOTE: This tool can only run on recent versions of `Ubuntu/Debian/Fedora Linux` by default.**

### Custom configrations

```shell
cp custom.env.example custom.env

# write your own settings
vi custom.env
```

### Build on default OS platforms(Ubuntu/Debian/Fedora Linux)

```shell
make prepare # execute once
make build # execute every time
```

**OR**

```shell
make # "make prepare + make build"
```

### Build on custom OS platforms

Manually install system dependencies based on your OS platform:
```shell
# Ubuntu example
apt install --no-install-recommends -y \
    golang ca-certificates build-essential \
    python3 python3-dev python3-venv python3-pip \
    gettext-base jq wget curl

# Fedora example
dnf install -y golang ca-certificates \
        python3 python3-devel python3-pip \
        make pkg-config gcc gcc-c++ kernel-devel gettext jq wget curl

# Gentoo/Redhat/Suse ...
# ...
# Your installation commands equivalent to the above two OSs are
# ...
```

Prapare:
```shell
# Use `make prepare_minimal` instead of `make prepare`
make perpare_minimal
```

Build:
```shell
make build
```
