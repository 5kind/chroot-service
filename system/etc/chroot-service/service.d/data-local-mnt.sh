CHROOTDIR=/data/local/mnt   # set chrootdir here
MODNAME=chroot-service
CHROOT_INIT="$BASH $CHROOT $CHROOT_ARGS $CHROOTDIR $INIT"
LOGFILE=/cache/${CHROOTDIR##*/}.log
# source /etc/$MODNAME/profile

chroot_init() {
    ensure_bash_executable
    ensure_mounted $CHROOTDIR
    exec $CHROOT_INIT
} 2>&1 > "$LOGFILE"

chroot_init
