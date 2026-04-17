#!/bin/bash
# Install some programs
sudo apt install ctwm xscreensaver xscreensaver-data scrot wmctrl numlockx
# Hook .xsession to .xinitrc
ln -s ~/.xinitrc ~/.xsession
