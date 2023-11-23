# Next function API is accessible to scripts.
ensure_mounted() {
    local folder="$1"
    while ! mountpoint -q "$folder" 2>/dev/null ;do
        sleep $SLEEP_TIME
    done
}

ensure_exist(){
    local folder="$1"
    while [ ! -e $folder ] ;do
        sleep $SLEEP_TIME
    done
}

# Make sure $exe $args is available.
ensure_executable() {
    local exe=$1
    shift
    local args=${@}

    while ! $exe $args 2>/dev/null ;do
        sleep $SLEEP_TIME
    done
}

# Before chroot, make sure bash is available.
ensure_bash_executable() {
    case $CHROOT in
        *arch-chroot*)          ;;
        *)      return 0        ;;
    esac
    [ -z $BASH ] && BASH=/bin/bash
    ensure_executable $BASH --version
}

# This function use to make sure boot-completed.d after sys.boot_completed;
ensure_boot_completed(){
    while [ "$(getprop sys.boot_completed)" != "1" ]; do
        sleep $SLEEP_TIME
    done    
}

# This function make sure data has been decrypted, require unlock the devices; 
ensure_data_decrypted(){
    ensure_mounted /storage/emulated
}