dest=$PREFIX/tmp/.X11-unix
ensure_mounted $dest
chcon --reference=$PREFIX $dest
