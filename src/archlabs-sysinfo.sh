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

bold=$(tput bold)
normal=$(tput sgr0)

case "$SHELL" in
  "/usr/bin/zsh" | "/bin/zsh") USING=$(zsh --version | cut -c -9) ;;
  "/usr/bin/bash" | "/bin/bash") USING=$(bash --version | grep "GNU bash, version" | awk {'print $4'}) ;;
esac

UPTIME=$(uptime | awk -F'( |,|:)+' '{print $8,"hours, " $7" minutes"}')

echo
echo $color1 "      /\      " ${bold}User:${normal} $(whoami)
echo $color2 "     /^^\     " ${bold}OS:${normal} $(head -n1 /etc/issue | cut -f 1 -d ' ')
echo $color3 "    / /\ \    " ${bold}Kernel:${normal} $(uname -r)
echo $color4 "   / //\\\ \   " ${bold}Shell:${normal} $USING
echo $color5 "  / //  \\\ \  " ${bold}Uptime:${normal} $UPTIME
echo $color6 " / _\\\()//_ \ " ${bold}Terminal:${normal} $TERM
echo $color6 "///    /   \\\\\\" ${normal}
echo
