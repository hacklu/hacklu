#
# ~/.bashrc
#

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lah'
alias vi='vim'
alias p='pacman'
alias c='clear'
alias grep='grep --color'
PS1='[\u@\h \W]\$ '
source ~/.bashrc
