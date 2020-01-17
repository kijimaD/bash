#!/bin/sh

export XDG_RUNTIME_DIR="/run/user/1000"

echo '実行'
# echo `amixer sget Master`

# HOUR=$(date +%I)
# ZHOUR=$(echo $HOUR | sed 's/^0*//')
# DISPLAY=:0 notify-send --expire-time=1000 --urgency=critical --icon=/usr/share/icons/gnome/256x256/status/appointment-soon.png "It is ""$ZHOUR"" o'clock"

# /usr/bin/aplay /home/kijima/bash/win_nt.wav
/usr/bin/aplay $1
