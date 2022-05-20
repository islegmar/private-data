#!/bin/bash

# =================================================
# Variables
# =================================================
silent=0
tmpFile=/tmp/$(basename $0)
url="https://drive.google.com/file/d/17km7yRqEAKCyDi9adGeiTcaS--JQl3zJ/view?usp=sharing"
file="out.txt"

# =================================================
# Functions
# =================================================
function help() {
  cat<<EOF
NAME
       `basename $0` - SUMMARY

SYNOPSIS
       `basename $0` [-s] [-h] [-f file] -u url

DESCRIPTION
       INFO

       -s
              Silent mode

       -h
              Show this help

       -d     
              Folder where repos are clonned (def: $dir)
EOF
}

function trace() {
  [ $silent -eq 0 ] && echo $* >&2
}

# =================================================
# Arguments
# =================================================
while getopts "hsf:u:" opt
do
  case $opt in
    h)
      help
      exit 0
      ;;
    s) silent=1 ;;
    u) url=$OPTARG ;;
    f) file=$OPTARG ;;
    *)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done
shift $(( OPTIND - 1 ))

# --- Check Arguments
errors=""

#[[ -z "$dir" ]] && errors="${errors}A folder must be specified. "

if [[ ! -z "$errors" ]]
then
  trace $errors
  exit 1
fi

# =================================================
# main
# =================================================
rm ${tmpFile}* 2>/dev/null

# YOUR CODE HERE
url="https://drive.google.com/file/d/17km7yRqEAKCyDi9adGeiTcaS--JQl3zJ/view?usp=sharing"
id=$(echo $url|sed -e 's#/[^/]*$##; s#.*/##')
url_down="https://drive.google.com/uc?export=download&id=${id}"
wget -q --no-check-certificate ${url_down} -O ${file}
echo "Document with id: $id and url: $url_down saved as $file!"

rm ${tmpFile}* 2>/dev/null

