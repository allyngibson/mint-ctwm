#!/bin/sh

# Launch screensaver
/usr/bin/xscreensaver --no-splash &

# Right panel
/usr/bin/xlogo -geometry 120x1440-0+120 -fg gray8 -bg gray8 &
/usr/bin/xclock -geometry 120x120-0-0 -fg gray98 -bg black &
/usr/bin/xlogo -geometry 120x120-0+0 &
/usr/bin/xload -geometry 120x80-0-750 -fg lightseagreen -bg black -hl gray98 & # 2560 x 1440
/usr/bin/xeyes -geometry 120x80-0+526 -fg black & # 2560 x 1440
# /usr/bin/xload -geometry 120x80-0-666 -fg lightseagreen -bg black -hl gray98 & # 1920 x 1080
# /usr/bin/xeyes -geometry 120x80-0-746 -fg black & # 1920 x 1080

# Disable Caps Lock
setxkbmap -option caps:none &

# Turn on Num Lock
numlockx on

# Set XDG_CURRENT_DESKTOP
export XDG_CURRENT_DESKTOP=ctwm

# Launch CTWM
/usr/bin/ctwm
