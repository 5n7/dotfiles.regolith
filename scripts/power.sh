#!/usr/bin/env bash

lock=" Lock"
logout=" Logout"
reboot=" Reboot"
shutdown=" Shutdown"
suspend="鈴 Suspend"

options="$lock\n$logout\n$reboot\n$shutdown\n$suspend"

chosen="$(echo -e "$options" | rofi -dmenu -i -matching fuzzy)"
case $chosen in
"$lock")
  sh "$DOTFILES/scripts/lock.sh"
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
  sh "$DOTFILES.scripts/lock.sh" && systemctl suspend
  ;;
esac
