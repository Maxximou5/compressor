#!/bin/bash
# Bzip2 Compression Script
# Author: Maxximou5
# Website: https://maxximou5.com
# Version: 1.0.0
# Date: 2018-11-05

set -ueo pipefail

default="\e[0m"
red="\e[31m"
lightred="\e[91m"
green="\e[32m"
lightgreen="\e[92m"
yellow="\e[33m"
lightyellow="\e[93m"
blue="\e[34m"
lightblue="\e[94m"
magenta="\e[35m"
lightmagenta="\e[95m"
cyan="\e[36m"
lightcyan="\e[96m"
creeol="\r\033[K"

usage()
{
    echo "compressor, a simple bash file compressor. Version 1.0.0, 5-Nov-2018."
    echo ""
    echo "Usage: $0 [options] [path]"
    echo ""
    echo -e "   -h\t        | Print this message."
    echo -e "   -k\t        | Keep the original files after compression."
    echo -e "   -r\t        | Remove the original files after compression."
    echo -e "   -o\t        | Overwrite existing output files."
    echo ""
    echo -e "Example: $0 -ko /var/www/fastdl"
    echo ""
    exit 1
}

if [ $# -eq 0 ]
  then
    usage
fi

path=$2
logfile=compressor.log

prompt()
{
    local prompt="$1"
    local initial="$2"

    if [ "${initial}" == "Y" ]; then
        prompt+=" [Y/n] "
    elif [ "${initial}" == "N" ]; then
        prompt+=" [y/N] "
    else
        prompt+=" [y/n] "
    fi

    while true; do
        read -e -i "${initial}" -p  "${prompt}" -r yn
        case "${yn}" in
            [Yy]|[Yy][Ee][Ss]) return 0 ;;
            [Nn]|[Nn][Oo]) return 1 ;;
        *) echo "Please answer yes or no." ;;
        esac
    done
}

compressed()
{
    echo "======================================="
    echo -e "${green}Compressed!${default}"
    echo ""
}

nothing()
{
    echo "======================================="
    echo -e "${lightred}There was nothing to compress...${default}"
    echo ""
}


if [ "$1" = "-k" ]; then
    {
        echo ""
        echo -e "${cyan}Keeping original files.${default}"
        echo ""
        if ! prompt "   Continue?" Y; then
            echo Exiting;
            exit 1
        fi
    }
    echo ""
    echo "Compressing..."
    output=$( find ${path} -type f -not -name \*.bz2 -exec bzip2 -zkv9 \{\} \; 2>&1 )
    echo "=======================================" >> $logfile 2>&1
    echo "$output" >> $logfile 2>&1
    input=$( echo "$output" | sed '/already/d' )
    if [[ -z "${input/[ ]*\n/}" ]]; then
        nothing
    else
        compressed
    fi
elif [ "$1" = "-ko" ]; then
    {
        echo ""
        echo -e "${cyan}Keeping original files.${default}"
        echo -e "${yellow}WARNING:${default} Overwriting existing output files!${default}"
        echo ""
        if ! prompt "   Continue?" Y; then
            echo Exiting;
            exit 1
        fi
    }
    echo ""
    echo "Compressing..."
    output=$( find ${path} -type f -not -name \*.bz2 -exec bzip2 -zkvf9 \{\} \; 2>&1 )
    echo "=======================================" >> $logfile 2>&1
    echo "$output" >> $logfile 2>&1
    input=$( echo "$output" | sed '/already/d' )
    if [[ -z "${input/[ ]*\n/}" ]]; then
        nothing
    else
        compressed
    fi
    exit 1
elif [ "$1" = "-r" ]; then
    {
        echo ""
        echo -e "${cyan}Removing original files.${default}"
        echo ""
        if ! prompt "   Continue?" Y; then
            echo Exiting;
            exit 1
        fi
    }
    echo "Compressing..."
    output=$( find ${path} -type f -not -name \*.bz2 -exec bzip2 -zv9 \{\} \; 2>&1 )
    echo "=======================================" >> $logfile 2>&1
    echo "$output" >> $logfile 2>&1
    input=$( echo "$output" | sed '/already/d' )
    if [[ -z "${input/[ ]*\n/}" ]]; then
        nothing
    else
        compressed
    fi
elif [ "$1" = "-ro" ]; then
    {
        echo ""
        echo -e "${cyan}Removing original files!${default}"
        echo -e "${yellow}WARNING:${default} Overwriting existing output files!${default}"
        echo ""
        if ! prompt "   Continue?" Y; then
            echo Exiting;
            exit 1
        fi
    }
    echo ""
    echo "Compressing..."
    output=$( find ${path} -type f -not -name \*.bz2 -exec bzip2 -zvf9 \{\} \; 2>&1 )
    echo "=======================================" >> $logfile 2>&1
    echo "$output" >> $logfile 2>&1
    input=$( echo "$output" | sed '/already/d' )
    if [[ -z "${input/[ ]*\n/}" ]]; then
        nothing
    else
        compressed
    fi
else
    usage
    exit 1
fi