CHROOTDIR=/data/local/mnt       # set chrootdir here
if [ -z $BASH ] ;then
    DAEMON=$(command -v $CHROOT)
    DAEMON_OPTS="$CHROOT_ARGS $CHROOTDIR $BASH"
else
    DAEMON=$(command -v $BASH)
    DAEMON_OPTS="$CHROOT $CHROOT_ARGS $CHROOTDIR $INIT"
fi
CHROOT_NAME=${CHROOTDIR##*/}
LOGFILE=/cache/$CHROOT_NAME.log # logfile
NAME=$CHROOT_NAME
PIDDIR=/data/local/run
PIDFILE=$PIDDIR/$NAME.pid

start(){
    ensure_bash_executable
    ensure_mounted $CHROOTDIR
    mkdir -p $PIDDIR
    start-stop-daemon -S -b -m -p $PIDFILE -x $DAEMON -- $DAEMON_OPTS 2>&1 $LOGFILE
}

stop(){
    start-stop-daemon -K -s 1 -o -p $PIDFILE
}

case "$1" in
    start|'')
        echo -n "Starting daemon: "$NAME
        start
        echo "."
        ;;
    stop)
        echo -n "Stopping daemon: "$NAME
        stop
        echo "."
        ;;
    restart)
        echo -n "Restarting daemon: "$NAME
        stop
        start
        echo "."
        ;;

    *)
        echo "Usage: "$1" {start|stop|restart}"
        exit 1
esac

exit 0
