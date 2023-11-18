##########################################################################################
# Main
##########################################################################################

# install bash
[[ -e /system/bin/bash && ! -L /system/bin/bash ]] ||
ln -s /data/data/com.termux/files/usr/bin/bash $MODPATH/system/bin
# install hostname
if [[ "$HOSTNAME" != "localhost" && ! -z "$HOSTNAME" ]] ;then
  printf "$HOSTNAME" > $MODPATH/system/etc/hostname
elif [ -f /etc/hostname ] ;then
  cp /etc/hostname $MODPATH/system/etc/hostname
fi
# install mtab
ln -s /proc/self/mounts $MODPATH/system/etc/mtab
# remove scripts
[ "$KSU" ] || rm -f $MODPATH/{boot-completed,post-mount}.sh
