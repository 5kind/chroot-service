# chroot-service configure	-*- shell-script -*-
# SPDX-License-Identifier: GPL-2-or-later
#
# This file is part of chroot-service modules.
#
# Copyright (C) 2023 5kind
MODDIR=${0%/*}
MODNAME="${MODDIR##*/}"
ETCDIR="/etc/$MODNAME"
LOGFILE="/cache/$MODNAME.log"
# config
SLEEP_TIME=5
# This function use to make sure boot-completed.d after /data decryption;
# you may need to unlock your device after reboot;
wait_decryption(){
    while [ ! -e /data/data/android ] ;do
        sleep $SLEEP_TIME
    done
}
# service start |env: blocking
service_start(){
    printf "* Starting service ${service##*/} ...\t"
    if test -r "$service"; then
        if $blocking; then
            . "$service" &&
            printf "%s" "[  OK  ]" ||
            printf "%s" "[FAILED]"
        else
            . "$service" &
            printf "%s" "[  OK  ]"
        fi
    fi
    printf "\n"
}

serviced_block(){
    local serviced=$1
    local blocking=$2
    if test -d $ETCDIR/$serviced/ ; then
        for service in $ETCDIR/$serviced/*.sh; do
            service_start
        done
        unset service
    fi
}

main(){
    source $ETCDIR/profile
    serviced_block post-fs-data.d true
    serviced_block service.d false
    printf "* Waitting for /data decryption...\n"
    wait_decryption
    serviced_block boot-completed.d false
    printf "* Service start completed.\n"
} 2>&1 > "$LOGFILE"

main
