# .bashrc

MY_DOTFILES_PATH=`dirname "$(readlink -f "${BASH_SOURCE[0]}")"`

[[ -f ${MY_DOTFILES_PATH}/.bash_scripts/.bash_env ]] && \
    . ${MY_DOTFILES_PATH}/.bash_scripts/.bash_env

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

[[ -f ${MY_DOTFILES_PATH}/.bash_profile ]] && \
    . ${MY_DOTFILES_PATH}/.bash_profile

#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
[[ -f /etc/bash_completion ]] && \
    . /etc/bash_completion

[[ -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion


[[ -f ${MY_DOTFILES_PATH}/.bash_profile ]] && \
    . ${MY_DOTFILES_PATH}/.bash_profile


[[ -f ${MY_DOTFILES_PATH}/.bash_scripts/.bash_aliases ]] && \
    . ${MY_DOTFILES_PATH}/.bash_scripts/.bash_aliases

[[ -f ${MY_DOTFILES_PATH}/.bash_scripts/.bash_functions ]] && \
    . ${MY_DOTFILES_PATH}/.bash_scripts/.bash_functions
