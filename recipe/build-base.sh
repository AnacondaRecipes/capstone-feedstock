#!/usr/bin/env bash
set -ex

# install C lib
export PREFIX="${PREFIX}"
./make.sh
./make.sh install
