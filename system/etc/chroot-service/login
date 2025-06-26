#!/data/data/com.termux/files/usr/bin/sh
. /etc/chroot-service/profile
# Load everything from the run script except the exec command
temp_script=$(mktemp)
workdir="${0%/*}"
sed '/^[[:space:]]*exec /d' "$workdir/run" > "$temp_script"
. "$temp_script"
rm -f "$temp_script"

if sv ok "$service"; then
    unset LD_PRELOAD
    chroot "/proc/$(cat $workdir/supervise/pid)/root/$chrootdir"
else
    exec $chrootcmd $chrootargs $chrootdir $stopcmdproc $chrootinit $init_args
fi
