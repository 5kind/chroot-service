# Install & upgrade from submodule
set -e
git_root=$(git rev-parse --show-toplevel)
cd "$git_root/common/arch-install-scripts"; make
install -vDm755 "$git_root/common/arch-install-scripts/termux-arch-chroot" \
"$git_root/system/bin/termux-arch-chroot"
mkdir -pv "$git_root/system/etc/chroot-service"
cp -rv "$git_root/common/chroot-systemctl/"* "$git_root/system/etc/chroot-service"
rm -fv "$git_root/system/etc/chroot-service/README.md"
rm -fv "$git_root/system/etc/chroot-service/doc/README*.md"
