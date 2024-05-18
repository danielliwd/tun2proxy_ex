#!/bin/bash

if [ -e /app/setup.rc ]; then
	source /app/setup.rc
fi

if [ ! -e /etc/profile.d/local.sh ]; then
	if [ -e /app/bashrc ]; then
		ln -s /app/bashrc /etc/profile.d/local.sh
	fi
fi

exec "$@"
