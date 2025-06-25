file2check="$chrootdir/etc/resolv.conf"
conf_invalid=false

if [ ! -f "$file2check" ]; then
    conf_invalid=true
else
    processed_content=$(sed '/^[[:space:]]*#/d; /^[[:space:]]*$/d' "$file2check")
    if [ -z "$processed_content" ]; then
        conf_invalid=true
    fi
fi

if $conf_invalid; then
    echo "INFO: '$file2check' is empty or contains only comments. Initializing..."
    install -Dm644 "$PREFIX/etc/resolv.conf" "$file2check"
else
    echo "INFO: '$file2check' contains active configuration. Skipping."
fi
