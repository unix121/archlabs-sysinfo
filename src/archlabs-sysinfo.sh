#!/usr/bin/env bash

# Author : Unix121
# GitHub : github.com/unix121
# E-mail : unix121@protonmail.com
# Description : Simple bash script that displays some
#               system information using the terminal
#               colors. Designed to be minimalistic and
#               easy to configure/change.

# Update [December 22, 2017] : Modified with ArchLabs Linux Ascii Logo

printf -v color0 %b "\e[30m"
printf -v color1 %b "\e[31m"
printf -v color2 %b "\e[32m"
printf -v color3 %b "\e[33m"
printf -v color4 %b "\e[34m"
printf -v color5 %b "\e[35m"
printf -v color6 %b "\e[36m"
printf -v color7 %b "\e[37m"

bold=$(tput bold)
normal=$(tput sgr0)

case "$SHELL" in
  "/usr/bin/zsh" | "/bin/zsh") USING=$(zsh --version | cut -c -9) ;;
  "/usr/bin/bash" | "/bin/bash") USING=$(bash --version | grep "GNU bash, version" | awk {'print $4'}) ;;
esac

OS='ArchLabs Linux'
UPTIME=$(uptime -p | sed 's/up //')


echo
echo $color1 "      /\      " $color3 User:${normal} "   " $(whoami)
echo $color2 "     /^^\     " $color3 OS:${normal} "     " $OS
echo $color3 "    / /\ \    " $color3 Kernel:${normal} " " $(uname -r)
echo $color4 "   / //\\\ \   " $color3 Shell:${normal} "  " $USING
echo $color5 "  / //  \\\ \  " $color3 Uptime:${normal} " " $UPTIME
echo $color6 " / _\\\()//_ \ " $color3 Terminal:${normal} $TERM
echo ${bold}$color0 "///    /   \\\\\\" ${normal}$color3 Packages:${normal} $(pacman -Q | wc -l)
echo
