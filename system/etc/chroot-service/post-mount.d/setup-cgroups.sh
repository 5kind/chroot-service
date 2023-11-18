#!/bin/sh
set -e

export PATH=$PATH:/system/xbin:/system/bin

ln_cg(){
    local src=$1
    local scg="/sys/fs/cgroup/${2}"

    if mountpoint -q "${src}" && [ ! -e "${scg}" ]; then
        ln -s "${src}" "${scg}" || true
    fi
}

if ! mountpoint -q /sys/fs/cgroup; then
        mount -t tmpfs -o mode=755,nodev,noexec,nosuid tmpfs /sys/fs/cgroup
fi

ln_cg /acct cpuacct
ln_cg /dev/blkio blkio
ln_cg /dev/cpuctl cpu
ln_cg /dev/cpuset cpuset
ln_cg /dev/memcg memory
ln_cg /dev/stune schedtune

for cg in blkio cpu cpuacct cpuset devices freezer memory schedtune; do
        if [ ! -d "/sys/fs/cgroup/${cg}" ]; then
                mkdir -p "/sys/fs/cgroup/${cg}"
        fi

        if ! mountpoint -q $(realpath /sys/fs/cgroup/${cg}); then
                mount -t cgroup -o "${cg}" cgroup "/sys/fs/cgroup/${cg}" || true
        fi
done
