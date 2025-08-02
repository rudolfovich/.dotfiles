#!/bin/bash

target_links=(\
  .git
  .vim
  .bash_logout
  .bash_profile
  .bashrc
  .gitconfig
  .gitmessage.txt
  .inputrc
  .profile
  .vimrc
  .Xresources
  uncrustify.cfg
  uncrustify.cfg.txt
  user-config.jam
)

script_file=$(readlink -f "${BASH_SOURCE[0]}")
script_path=$(dirname $script_file)
log_file="${script_path}/install.log"
is_color_terminal=`(echo "${TERM}" | grep -q color) && echo y || echo n`
log_format_str_color='%s%s [%s] %14s: %s%s\n'
log_format_str_default='%1$s [%2$s] %3$14s: %4$s\n'
color_reset=$(echo -e "\e[00m")

function log()
{
  local error_level="${1:?Log level is required!}"
  local color=$(echo -e "${2:?Color argument is required!}")
  #[[ "${is_color_terminal}" != "y" ]] && color=''
  shift 2

  printf '%s%s [%s] %14s: %s%s\n' \
    "${color}" \
    "${error_level}" \
    "$(date +%d.%m.%y\ %H:%M:%S)" \
    "${FUNCNAME[2]}()" \
    "$*" \
    "${color_reset}" \
    | tee -a "${log_file}"
}

function debug()
{
  log DD "\e[37m" "$*"
}

function info()
{
  log II "\e[32m" "$*"
}

function warning()
{
  log WW "\e[33m" "$*"
}

function error()
{
  log EE "\e[31m" "$*"
}

function make_link()
{
  local filename="${script_path}/${1:?Target name is required argument!}"
  local linkname="${HOME}/${1}"

  info "..creating symbolic link: ${1}"
  info "....${filename} => ${linkname}"
  ln -sf "${filename}" "${linkname}"
}

info ""
info "==========================="
info "Installation script started"

for target_name in "${target_links[@]}"
do
  make_link "${target_name}"
done

info "script completed."
info "==========================="
info ""
