#!/usr/bin/env bash

choice=$(printf "Lock\nLogout\nSuspend\nReboot\nShutdown\nHibernate" | rofi -dmenu)
if [[ $choice == "Lock" ]];then
    bash ~/.config/scripts/wayland_session_lock
elif [[ $choice == "Logout" ]];then
    pkill -kill -u "$USER"
elif [[ $choice == "Suspend" ]];then
    systemctl suspend
elif [[ $choice == "Reboot" ]];then
    systemctl reboot
elif [[ $choice == "Shutdown" ]];then
    systemctl poweroff
elif [[ $choice == "Hibernate" ]];then
    systemctl hibernate
fi
