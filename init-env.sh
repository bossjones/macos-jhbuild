#!/usr/bin/env bash

# Usage: source init-env.sh
# do this before trying to build anything with jhbuild

env -i bash --rcfile /etc/profile

export TERM=xterm
export PATH=/usr/bin:/bin:/usr/sbin/:/sbin
export HOME=~/

