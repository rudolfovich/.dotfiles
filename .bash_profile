# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

export BCMGCC=${HOME}/projects/broadcom/stbgcc-4.5.3-2.4
export HUMAX_BCMSRC=${HOME}/projects/broadcom/humax/src
export HUMAXSHARED_BCMSRC=${HOME}/projects/broadcom/humax/src
export ELTEX_BCMSRC=${HOME}/projects/broadcom/humax/src
export SMARTLABS_BCMSRC=${HOME}/projects/broadcom/humax/src
export INFOMIR_BCMSRC=${HOME}/projects/broadcom/humax/src

