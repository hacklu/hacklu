" An example for a vimrc file. Edit by hacklu !!!!
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

set nocompatible
"for vim Bundle (out)
"filetype off

set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感


set fileencodings=utf-8,chinese,latin-1

if has("win32")
	set fileencodings=chinese
	set guioptions=
else
	set encoding=utf-8
	set ff=unix
	set tags=tags
	map<silent> <F7> :TlistToggle<cr>
	"colorscheme darkburn
	set background=dark
	"colorscheme solarized
	colorscheme default
endif

" 在输入模式下移动光标，彻底抛弃方向键 大爱！！！！！！
inoremap <C-h> <left>
inoremap <C-j> <C-o>gj
inoremap <C-k> <C-o>gk
inoremap <C-l> <Right>
inoremap <M-h> <C-o>b
inoremap <M-l> <C-o>w
inoremap <C-a> <Home>
inoremap <C-e> <End>

set laststatus=2
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)
" 设置在状态行显示的信息

let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr> " add by hacklu
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set nobackup		" no backup!
set history=500		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""
"cscope setting 
""""""""""""""""""""""""""""""""""""""""""""""""""""
"use plugin instead


set autochdir

map <silent> <F4> :set mouse=<cr>


set t_Co=256
"NERD_commenter.vim
let mapleader=","
map <silent> <F5> ,cc 
map <silent> <F6> ,cu

map <silent> <F3> :%!xxd <cr>
map <silent> <F4> :%!xxd -r <cr>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"set EasyMotion Leader key to only one ,
let mapleader=','
let g:EasyMotion_leader_key ='<Leader>'
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade Comment

"set ctrlp to ctrl-m
let g:ctrlp_map = '<c-m>'
"let g:ctrlp_cmd = 'CtrlM'‘
