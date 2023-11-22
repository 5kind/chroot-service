##########################################################################################
# function
##########################################################################################
keep_system_file(){
  local system_file=/system${1}
  [ -e ${system_file} ] && rm -rf ${MODPATH}${system_file} &&
  cp -rv ${system_file} ${MODPATH}${system_file}
}

merge_system_file(){
  local system_file=/system${1}
  if [ -d ${system_file} ] ;then
    cp -rvn ${system_file}/* ${MODPATH}${system_file}
  else
    keep_system_file $1
  fi
}
##########################################################################################
# Main
##########################################################################################
# install bash
[[ -e /system/bin/bash && ! -L /system/bin/bash ]] ||
ln -s /data/data/com.termux/files/usr/bin/bash $MODPATH/system/bin
# install hostname
if [[ "$HOSTNAME" != "localhost" && ! -z "$HOSTNAME" ]] ;then
  printf "$HOSTNAME" > $MODPATH/system/etc/hostname
else
  keep_system_file /etc/hostname
fi
# install mtab
ln -s /proc/self/mounts $MODPATH/system/etc/mtab
# remove scripts for magisk
[ "$KSU" ] || rm -f $MODPATH/{boot-completed,post-mount}.sh
# keep old config & service
keep_system_file /etc/fstab
keep_system_file /etc/$MODID/fstab
merge_system_file /etc/$MODID/boot-completed.d
keep_system_file /etc/$MODID/profile.d/chroot-config.sh