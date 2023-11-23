# chroot-service service.sh	-*- shell-script -*-
# SPDX-License-Identifier: GPL-2-or-later
#
# This file is part of chroot-service modules.
#
# Copyright (C) 2023 5kind
MODDIR=${0%/*}
MODID="${MODDIR##*/}"
ETCDIR="/etc/$MODID"
LOGFILE="/cache/$MODID.log"

post_mount(){
    printf "* Service start with Magisk mode.\n"
    serviced_block post-mount.d true
}

boot_completed(){
    printf "* Waitting for /data decryption...\n"
    ensure_boot_completed
    serviced_block boot-completed.d false
    printf "* Service start completed.\n"
}

main(){
    source $ETCDIR/profile
    [ "$KSU" ] || post_mount
    serviced_block service.d false
    [ "$KSU" ] || boot_completed
} >> "$LOGFILE" 2>&1

[ "$KSU" ] || mv "$LOGFILE" "$LOGFILE".bak
main
