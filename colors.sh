#!/bin/bash
if tput setaf 1 &> /dev/null; then
    tput sgr0
    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
        BASE03=$(tput setaf 234)
        BASE02=$(tput setaf 235)
        BASE01=$(tput setaf 240)
        BASE00=$(tput setaf 241)
        BASE1=$(tput setaf 245)
        BASE2=$(tput setaf 254)
        BASE3=$(tput setaf 230)
        RED=$(tput setaf 160)
        YELLOW=$(tput setaf 136)
        ORANGE=$(tput setaf 166)
        MAGENTA=$(tput setaf 125)
        VIOLET=$(tput setaf 61)
        BLUE=$(tput setaf 33)
        CYAN=$(tput setaf 37)
        GREEN=$(tput setaf 64)
        COLOR_NONE=$(tput sgr0)
    else
        BASE03=$(tput setaf 8)
        BASE02=$(tput setaf 0)
        BASE01=$(tput setaf 10)
        BASE00=$(tput setaf 11)
        BASE1=$(tput setaf 14)
        BASE2=$(tput setaf 7)
        BASE3=$(tput setaf 15)
        RED=$(tput setaf 1)
        YELLOW=$(tput setaf 3)
        ORANGE=$(tput setaf 9)
        MAGENTA=$(tput setaf 5)
        VIOLET=$(tput setaf 13)
        BLUE=$(tput setaf 4)
        CYAN=$(tput setaf 6)
        GREEN=$(tput setaf 2)
        COLOR_NONE=$(tput sgr0)
    fi
    BOLD=$(tput bold)
else
    RED="\[\033[0;31m\]"
    YELLOW="\[\033[1;33m\]"
    GREEN="\[\033[0;32m\]"
    BLUE="\[\033[1;34m\]"
    LIGHT_RED="\[\033[1;31m\]"
    LIGHT_GREEN="\[\033[1;32m\]"
    WHITE="\[\033[1;37m\]"
    LIGHT_GRAY="\[\033[0;37m\]"
    COLOR_NONE="\[\e[0m\]"
    BOLD=""
fi
