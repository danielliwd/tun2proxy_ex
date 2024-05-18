#!/bin/bash

set -e
mkdir -p ./app

# install tun2proxy
# https://github.com/tun2proxy/tun2proxy.git
cargo install tun2proxy \
	--target x86_64-unknown-linux-gnu --target-dir ./

cp ~/.cargo/bin/tun2proxy ./app/
cp ./scripts/* app/

docker build . -t debian_tun
