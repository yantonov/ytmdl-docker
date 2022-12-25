#!/bin/sh

cd "$(dirname "$0")/docker"

make run $@
