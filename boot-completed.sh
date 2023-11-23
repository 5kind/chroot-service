# chroot-service boot-completed.sh	-*- shell-script -*-
# SPDX-License-Identifier: GPL-2-or-later
#
# This file is part of chroot-service modules.
#
# Copyright (C) 2023 5kind
MODDIR=${0%/*}
MODID="${MODDIR##*/}"
ETCDIR="/etc/$MODID"
LOGFILE="/cache/$MODID.log"

boot_completed(){
    source $ETCDIR/profile
    serviced_block boot-completed.d false
    ensure_data_decrypted
    printf "* Service start completed.\n"
} >> "$LOGFILE" 2>&1

boot_completed