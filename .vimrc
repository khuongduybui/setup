set shell=/bin/bash
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'dag/vim-fish'
" Bundle 'terryma/vim-multiple-cursors'
Bundle 'mg979/vim-visual-multi'
" Plugin 'ssh://git.amazon.com:2222/pkg/VimAmazonWiki.git'
Plugin 'zxqfl/tabnine-vim'

syntax enable
filetype plugin indent on
set number
set ff=unix
set ft=markdown
