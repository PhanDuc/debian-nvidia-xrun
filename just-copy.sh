#!/bin/sh

if [ -f /etc/X11/xorg.conf ]; then
   sudo mv /etc/X11/xorg.conf /etc/X11/xorg.conf.before.x-run
fi
sudo cp xorg.conf /etc/X11/xorg.conf
sudo cp nvidia-xrun /usr/bin/nvidia-xrun
sudo chmod +x /usr/bin/nvidia-xrun
sudo cp nvidia-xinitrc /etc/X11/xinit/nvidia-xinitrc
sudo cp nvidia-xorg.conf /etc/X11/nvidia-xorg.conf



