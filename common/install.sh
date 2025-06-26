service_scripts="locksettings-verify.sh start-container.sh auto-start-stop.sh"
global_service_d=/data/adb/service.d
static_service_d="$MODPATH/service.d"

for service_script in $service_scripts ; do
    local global_service="$global_service_d/$service_script"
    local static_service="$static_service_d/$service_script"
    if [ ! -e "$global_service" ] ; then
        install -Dm 644 "$static_service" "$global_service"
        ui_print "$service_script has been installed to $global_service"
        ui_print "Modified $global_service to custom service."
    else
        ui_print "$service_script already exists in $global_service"
        ui_print "Check if there is any modifications that require manual merging"
    fi
done

MOD_COMMON="$MODPATH/common"
MOD_SHARE="/data/adb/$MODID"
cp -r "$MOD_COMMON/$MODID" /data/adb
cp -r "$MOD_COMMON/chroot-systemctl" "$MOD_SHARE"
chmod +x "$MOD_SHARE"/chroot-systemctl/*bin/*
chmod +x "$MOD_SHARE"/chroot-systemctl/run
chmod +x "$MOD_SHARE"/chroot-systemctl/login
chmod +x "$MOD_SHARE"/chroot-systemctl/finish
