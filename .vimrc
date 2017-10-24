set shell=/usr/bin/fish
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'dag/vim-fish'
Bundle 'terryma/vim-multiple-cursors'

syntax enable
filetype plugin indent on
set number
