# .bashrc

if [[ "$(uname)" == "Darwin" ]]; then
  _dotfiles=`dirname "$(readlink "${BASH_SOURCE[0]}")"`
else
  _dotfiles=`dirname "$(readlink -f "${BASH_SOURCE[0]}")"`
fi
_scripts="${_dotfiles}/.bash_scripts"

[[ -f ${_scripts}/.bash_profile   ]] && source ${_scripts}/.bash_profile
[[ -f ${_scripts}/.bash_env       ]] && source ${_scripts}/.bash_env
[[ -f ${_scripts}/.bash_aliases   ]] && source ${_scripts}/.bash_aliases
[[ -f ${_scripts}/.bash_functions ]] && source ${_scripts}/.bash_functions

if [[ "$(uname)" != "Darwin" ]]; then
  # If not running interactively, don't do anything
  [[ "$-" != *i* ]] && return
fi

#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
[[ -f /etc/bash_completion ]] && source /etc/bash_completion

[[ -f /usr/share/bash-completion/bash_completion ]] && \
    source /usr/share/bash-completion/bash_completion

if [[ "$(uname)" != "Darwin" ]]; then 
  echo "Using Powerline"
  function _update_ps1() {
    PS1="$(~/powerline-shell.py $? 2> /dev/null)"
  }
  if [ "$TERM" != "linux" ]; then
     PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
  fi
fi

