# /etc/chroot-service/profile
# This script is a modified version of the /etc/chroot-service/profile found on
# Arch Linux systems (licensed GPLv2+).

# Append "$1" to $PATH when not already in.
# This function API is accessible to scripts in /etc/chroot-service/profile.d
# Modified: append a existing realpath to PATH
append_path () {
    local newpath="$1"
    if [ -d "$newpath" ] && [ -x "$newpath" ] ;then
        case ":$PATH:" in
            *:"$newpath":*)
                ;;
            *)
                PATH="${PATH:+$PATH:}$newpath"
        esac
    else
        return 1
    fi
}

export PATH

# Load profiles from /etc/chroot-service/profile.d
if test -d /etc/chroot-service/profile.d/; then
        for profile in /etc/chroot-service/profile.d/*.sh; do
                test -r "$profile" && . "$profile"
        done
        unset profile
fi

# Unload our profile API functions
unset -f append_path