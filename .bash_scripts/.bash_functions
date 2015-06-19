#!/bin/bash


function parse_git_branch_and_add_brackets {
#  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
$(which git 1>/dev/null 2>/dev/null && git rev-parse --abbrev-ref HEAD 2>/dev/null | sed -e "s/\(..*\)/ \\[\1\\]/")
}


function ansi2utf
{
  if [ -z "$1" -o ! -f "$1" ]
  then
    echo "ansi2utf <filename>"
    echo ""
    echo "    <filename> is file in ansi (cp1251 crlf) formt to convert in unix (utf-8 lf) formt"
    echo ""
    echo "    [$1] file not found!"
    echo ""
    return 1;
  fi
  cp "$1" "$1.ansi"
  if [ 0 -ne $? ] ; then
    return 2;
  fi
  recode windows-1251..UTF-8 "$1"
  return $?;
}


function scan4ssh()
{
  local ip_range="192.168.0.50-255"
  if [ "$1" ]; then
    ip_range="$1"
  fi
  nmap -p22 --open -sV "${ip_range}"
}


function find_mac()
{
  if [ "$1" ]; then
    arp | grep "$1"
  else
    arp
  fi
}


# http://debback.blogspot.ru/2010/08/unzip-cp1251-utf-8.html
function convfn2utf8
{
    local newname=
    for f in "$@"; do
        newname="$(echo "$f" | iconv -f cp1252 -t cp850 | iconv -f cp866 -t utf-8)"
        echo "Converting from [$f]"
        echo "             to [$newname]..."
        read  -t 10 -p "Rename? [y/N]"
        if (echo "$REPLY" | grep -iq "y"); then
            mv -i "$f" "$newname"
            #convmv -f cp1252 -t cp850 "$f" --notest --nosmart
            #convmv -f cp866 -t utf-8 "`echo "$f" | iconv -f cp1252 -t cp850`" --notest --nosmart
        fi
    done
}


function scan4ip
{
  sudo nmap -sP 192.168.1.0/24
}


function gg
{
  echo "$@" | sed -e 's/\([[:upper:]]\)/_\L\1/g' -e 's/^m_\(.*\)$/\1_/g'
}

