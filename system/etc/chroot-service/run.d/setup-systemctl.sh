if [ ! -x "$chrootdir/bin/systemctl3.py" ]; then
    echo "INFO: Installing chroot systemctl to $chrootdir..."
    bin/systemctl-install $chrootdir
else
    echo "INFO: Chroot systemctl already installed in $chrootdir."
fi
