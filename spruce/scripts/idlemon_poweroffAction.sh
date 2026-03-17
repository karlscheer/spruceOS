#!/bin/sh

. /mnt/SDCARD/spruce/scripts/helperFunctions.sh

# This script is a wrapper to take action on an idle event sourced from:
# ./idlemon -p MainUI -t 30 -c 5 -s "/mnt/SDCARD/spruce/scripts/idlemon_poweroffAction.sh" -i

[ -z "$1" ] && exit 1

. /mnt/SDCARD/spruce/scripts/helperFunctions.sh
process_name=$1

# Handle different process names....
case "$process_name" in

    MainUI|ra32.*|ra64.*|retroarch*|drastic*|PPSSPP*)
        log_message "Got idle action from idlemon"
        /mnt/SDCARD/spruce/scripts/save_poweroff.sh
        ;;
    *)
        exit 1
        ;;
esac
