#!/bin/bash

cp -f scripts/* app/
docker run --name tun \
	--sysctl net.ipv6.conf.default.disable_ipv6=0 \
	--rm -it --privileged \
	-e PROXY_IP -e PROXY_PORT \
	-v $PWD/app:/app -w "/app" debian_tun /bin/bash -l "$@"
