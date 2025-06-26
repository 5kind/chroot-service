##########################################################################################
#
# MMT Extended Config Script
#
##########################################################################################
##########################################################################################
# Permissions
##########################################################################################

set_permissions() {
  set_perm_recursive $MODPATH/system/bin 0 0 0755 0755
  set_perm_recursive $MODPATH/system/etc/$MODID/bin 0 0 0755 0755
  set_perm_recursive $MODPATH/system/etc/$MODID/sbin 0 0 0755 0755
  set_perm_recursive $MODPATH/system/etc/$MODID/run 0 0 0755 0755
  set_perm_recursive $MODPATH/system/etc/$MODID/login 0 0 0755 0755
  set_perm_recursive $MODPATH/system/etc/$MODID/finish 0 0 0755 0755
}

##########################################################################################
# MMT Extended Logic - Don't modify anything after this
##########################################################################################

SKIPUNZIP=1
unzip -qjo "$ZIPFILE" 'common/functions.sh' -d $TMPDIR >&2
. $TMPDIR/functions.sh
