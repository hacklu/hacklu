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
PS1='[\u@\h \W]\$ '
#命令提示行
#Promote
#PS1='-------------------------------------\n\u@\h:\w\$ '
#Color Promote
#PS1='\[\033[01;32m\]       -------------------------------------------------------\[\033[00m\]\n${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
 

alias grep='grep --color=auto'

