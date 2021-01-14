#!/usr/bin/env bash
set -ex

# install C lib
export PREFIX="${PREFIX}"
if [[ ${target_platform} =~ osx-* ]]; then
  # The build fails when you set this. Kernel headers seem in-conflict with
  # user-space headers (or capstone headers/macros)
  # export CAPSTONE_HAS_OSXKERNEL=yes
  # .. we do use a similarly named variable in a patch though:
  export CAPSTONE_HAS_OSXKERNEL_CONDA=yes
  # .. we also elect not to pass macos-universal-no as the target
  export SDKROOT=${CONDA_BUILD_SYSROOT}
fi
./make.sh install
