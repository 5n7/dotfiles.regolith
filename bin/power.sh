#!/usr/bin/env sh

lock=" Lock"
logout=" Logout"
reboot=" Reboot"
shutdown=" Shutdown"
suspend="鈴 Suspend"

options="$lock\n$logout\n$reboot\n$shutdown\n$suspend"

chosen="$(echo "$options" | rofi -dmenu -i -matching fuzzy)"
case $chosen in
"$lock")
  lock.sh
  ;;
"$logout")
  i3-msg exit
  ;;
"$reboot")
  systemctl reboot
  ;;
"$shutdown")
  systemctl poweroff
  ;;
"$suspend")
  lock.sh && systemctl suspend
  ;;
esac
