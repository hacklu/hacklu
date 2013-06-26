#
# ~/.bashrc
#

#export LC_ALL="zh_CN.UTF-8"
# If not running interactively, don't do anything
#[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -la'
alias vi='vim'
alias p='pacman'
alias c='clear'
alias tmux='TERM=xterm-256color tmux -2'
alias grep='grep --color=auto'

PS1='[\u@\h \W]\$ '

export CCACHE_DIR="/home/hacklu/.ccache"
export CC="ccache gcc"
export CXX="ccache g++"
export PATH="/usr/lib/ccache:$PATH"
