#!/bin/bash

CCHAT_PATH="/root/prefix32/drive_c/Program Files/Microsoft Chat/CChat.exe"
if [ -f "$CCHAT_PATH" ]; then
  wine "$CCHAT_PATH" &
  exit 0
fi

# https://superuser.com/questions/978864/how-to-perform-unattended-installation-for-any-installer-using-wine
wine mschat25.exe &
# Wait until Wine initializes
while : ; do
    echo "Waiting for Wine to initialize..."
    sleep 0.15
    set +e  # Fix for: https://github.com/jordansissel/xdotool/issues/60
    WINDOW_ID=$(xdotool search --name "Microsoft*")
    set -e
    [[ -z $WINDOW_ID ]] || break
done

xdotool windowactivate $WINDOW_ID
xdotool key --delay 300 Return 
xdotool key --delay 300 Tab 
xdotool key --delay 300 Return

wine "$CCHAT_PATH" &
exit 0

