HOSTNAME(){
    if [ "$HOSTNAME" != "localhost" ] &&
    [ ! -z "$HOSTNAME" ] ;then
        return 0
    elif [ ! -f /etc/hostname ] ||
    [ ! -r /etc/hostname ] ;then
        return 1
    else
        HOSTNAME=$(cat /etc/hostname)
    fi
}

HOSTNAME &&
hostname "$HOSTNAME"
