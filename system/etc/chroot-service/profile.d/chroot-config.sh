### Chroot Config
PREFIX=/data/data/com.termux/files/usr
#BASH="$PREFIX/bin/bash"	# set bash  - use shebang(/bin/bash) by default.
CHROOT=termux-arch-chroot	# set chroot
ACTIVE_PATH="$PREFIX/bin"	# set script $PATH
# - set chroot args         # set /boot
MOUNT_ARGS="-f /etc/$MODID/fstab -b /data/adb/modules/chroot-service:/boot"
#CHROOT_USER=root           # set user
KEEPRESOLVCONF=false        # /etc/resolv.conf
UNSHARE=true                # unshare
MOUNTED=true                # set correct chrootdir mount status
# - if chrootdir MOUNTED, we wait for it, else we bind & remount to itself.
LOG_LEVEL=0                 # set log level
UNSHARE_LEVEL=2             # set unshare level
SLEEP_TIME=5                # set wait time for bash or mount
#CHROOTDIR=/data/local/mnt	# set chrootdir
# - set chroot environment
ENVIRONMENT="/bin/env PATH=/usr/local/sbin:/usr/local/bin\
:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$PATH"
[ -z "$INIT" ] &&
INIT="$ENVIRONMENT /usr/local/bin/init"				# init
HALT="$ENVIRONMENT /usr/local/bin/halt"				# halt
### Chroot Args
CHROOT_ARGS="$MOUNT_ARGS -p $ACTIVE_PATH:$PATH"

chroot_args_add(){
    CHROOT_ARGS="$CHROOT_ARGS ${@}"
}

$UNSHARE && chroot_args_add "-N"
$MOUNTED || chroot_args_add "-m"
$KEEPRESOLVCONF || chroot_args_add "-r"
[ -z $LOG_LEVEL ] || chroot_args_add "-l $LOG_LEVEL"
[ -z $CHROOT_USER ] || chroot_args_add "-u $CHROOT_USER"
[ -z $UNSHARE_LEVEL ] || chroot_args_add "-n $UNSHARE_LEVEL"
# CHROOT_INIT="$BASH $CHROOT $CHROOT_ARGS $CHROOTDIR $INIT"
