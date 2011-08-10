export LANG="zh_CN.UTF-8"
#export LC_ALL="zh_CN.UTF-8"
# If not running interactively, don't do anything
#[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lah'
alias vi='vim'
alias p='pacman'
alias c='clear'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

#[ -r /etc/bash_completion   ] && . /etc/bash_completion
