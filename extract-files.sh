#!/bin/bash
#
# Copyright (C) The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

export DEVICE=whyred
export VENDOR=xiaomi
export DEVICE_BRINGUP_YEAR=2025
export DEVICE_COMMON=sdm660-common

./../../$VENDOR/$DEVICE_COMMON/extract-files.sh "$@"

MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

AOSP_ROOT="$MY_DIR"/../../..
DEVICE_BLOB_ROOT="$AOSP_ROOT"/vendor/"$VENDOR"/"$DEVICE"/proprietary

patchelf --add-needed libcamera_sdm660_shim.so "$DEVICE_BLOB_ROOT"/vendor/lib/hw/camera.sdm660.so

sed -i 's|/system/etc/firmware|/vendor/firmware\x0\x0\x0\x0|g' "$DEVICE_BLOB_ROOT"/vendor/lib64/libgf_ca.so
