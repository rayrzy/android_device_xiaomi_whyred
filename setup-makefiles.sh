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

./../../$VENDOR/$DEVICE_COMMON/setup-makefiles.sh $@
