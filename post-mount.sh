# chroot-service post-mount.sh	-*- shell-script -*-
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
    printf "* Service start with KernelSU mode.\n"
    source $ETCDIR/profile
    serviced_block post-mount.d true
} > "$LOGFILE" 2>&1

mv "$LOGFILE" "$LOGFILE".bak
post_mount