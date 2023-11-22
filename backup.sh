#!/bin/sh
MODDIR=${0%/*}
[ "${0##*/}" = "backup.sh" ] || exit 1
bakdir="${MODDIR}/failback"
if [ -d "${bakdir}" ] ;then
    cp -rvn ${MODDIR}/system/* "${bakdir}"
elif [ ! -e "${bakdir}" ] ;then
    cp -rv ${MODDIR}/system "${bakdir}"
else
    exit 2
fi
