#!/bin/sh

export SRC="$(pwd)"

cd "$(dirname "$0")/docker"

make run $@
