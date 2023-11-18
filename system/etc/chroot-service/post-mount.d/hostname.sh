HOSTNAME(){
    if [ "$HOSTNAME" != "localhost" ] &&
    [ ! -z "$HOSTNAME" ] ;then
        printf "$HOSTNAME"
        return 0
    elif [ ! -f /etc/hostname ] ||
    [ ! -r /etc/hostname ] ;then
        return 1
    else
        cat /etc/hostname
    fi
}

hostname $(HOSTNAME)
