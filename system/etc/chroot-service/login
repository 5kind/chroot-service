#!/data/data/com.termux/files/usr/bin/sh
. /etc/chroot-service/profile
exec(){ echo "$@"; }    # Disable exec
workdir="${0%/*}"
cd $workdir && . run    # Load run except exec
if sv ok "$service"; then
    unset LD_PRELOAD
    chroot "/proc/$(cat $workdir/supervise/pid)/root/$chrootdir"
else
    unset -f exec
    exec $chrootcmd $chrootargs $chrootdir $stopcmdproc $chrootinit $init_args
fi
