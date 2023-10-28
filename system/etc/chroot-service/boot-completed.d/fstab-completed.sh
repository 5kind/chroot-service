mount_auto() {
  while read line; do
    src=$(echo "$line" | awk '{print $1}')
    dest=$(echo "$line" | awk '{print $2}')
    fstype=$(echo "$line" | awk '{print $4}')
    opts=$(echo "$line" | awk '{print $4}')
    [[ $opts == *"noauto"* ]] || continue
    try_create_dest
    mount $dest -v
  done < <(grep -vE '^\s*(#|$)' /etc/fstab)
}

mount_auto
