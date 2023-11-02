# service start |env: blocking
service_start(){
    printf "* Starting service ${service##*/} ...\t"
    if test -r "$service"; then
        if $blocking; then
            . "$service" &&
            printf "%s" "[  OK  ]" ||
            printf "%s" "[FAILED]"
        else
            . "$service" &
            printf "%s" "[  OK  ]"
        fi
    fi
    printf "\n"
}

serviced_block(){
    local serviced=$1
    local blocking=$2
    if test -d $ETCDIR/$serviced/ ; then
        for service in $ETCDIR/$serviced/*.sh; do
            service_start
        done
        unset service
    fi
}
