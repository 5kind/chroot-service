PREFIX=/data/data/com.termux/files/usr

mount_tmpfs() {
    local dest="$1"
    local opts=${2:-"mode=1777,nosuid,nodev"}

    [ -d "$dest" ] || mkdir -p "$dest"
    mountpoint -q $(realpath "$dest") || mount tmpfs "$dest" -t tmpfs -o "$opts"
    chcon --reference=$PREFIX $dest
}

ensure_exist $PREFIX
mount_tmpfs $PREFIX/tmp
mount_tmpfs $PREFIX/tmp/.X11-unix
mount_tmpfs $PREFIX/var/run rw,nosuid,nodev,relatime,mode=755
chown $(stat -c "%U:%G" $PREFIX) $PREFIX/var/run
