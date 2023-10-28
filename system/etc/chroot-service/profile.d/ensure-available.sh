# Next function API is accessible to scripts.
ensure_mounted() {
    $MOUNTED || return
    local folder="$1"

    while ! mountpoint -q "$folder" 2>/dev/null ;do
        warning "$folder is not mountpoint. Waiting ..."
        sleep $SLEEP_TIME
    done
}

ensure_executable() {
    local exe=$1
    shift
    local args=${@}

    while ! $exe $args 2>/dev/null ;do
        warning "$exe is not executable. Waiting ..."
        sleep $SLEEP_TIME
    done
}

ensure_bash_executable() {
    case $CHROOT in
        *arch-chroot*)          ;;
        *)      return 0        ;;
    esac
    [ -z $BASH ] && BASH=/bin/bash
    ensure_executable $BASH --version
}
