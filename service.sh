# chroot-service configure	-*- shell-script -*-
# SPDX-License-Identifier: GPL-2-or-later
#
# This file is part of chroot-service modules.
#
# Copyright (C) 2023 5kind
MODDIR=${0%/*}
MODID="${MODDIR##*/}"
ETCDIR="/etc/$MODID"
LOGFILE="/cache/$MODID.log"
# config
SLEEP_TIME=5

main(){
    source $ETCDIR/profile
    serviced_block post-fs-data.d true
    serviced_block service.d false
    printf "* Waitting for /data decryption...\n"
    ensure_data_decryption
    serviced_block boot-completed.d false
    printf "* Service start completed.\n"
} 2>&1 > "$LOGFILE"

main
