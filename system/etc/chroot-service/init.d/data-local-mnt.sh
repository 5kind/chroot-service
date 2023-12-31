CHROOTDIR=/data/local/mnt   # set chrootdir here
MODID=chroot-service
CHROOT_INIT="$BASH $CHROOT $CHROOT_ARGS $CHROOTDIR $INIT"
LOGFILE=/cache/${CHROOTDIR##*/}.log
# source /etc/$MODID/profile    # for non-build-in service.sh

chroot_init() {
    ensure_bash_executable
    # ensure_data_decrypted
    $MOUNTED && ensure_mounted $CHROOTDIR
    exec $CHROOT_INIT
} 2>&1 > "$LOGFILE"

chroot_init
