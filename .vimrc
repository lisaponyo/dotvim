set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'vim-scripts/Align'
Bundle 'vim-scripts/batch.vim'
Bundle 'vim-scripts/Zenburn'
Bundle 'vim-scripts/matchit.zip'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimfiler'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell'
Bundle 'thinca/vim-quickrun'
Bundle 'h1mesuke/unite-outline'
Bundle 'mattn/googletranslate-vim'
Bundle 'mattn/zencoding-vim'
Bundle 'ujihisa/neco-look'
Bundle 'ujihisa/unite-font'
Bundle 'kana/vim-vspec'
Bundle 'kana/vim-smartchr'
Bundle 'tpope/vim-surround'
Bundle 'tpope/altercation/solarized'
Bundle 'tpope/vim-rails'
Bundle 'kmnk/vim-unite-svn'
Bundle 'tacroe/unite-mark'
Bundle 'Sixeight/unite-grep'
Bundle 'jiangmiao/simple-javascript-indenter'

filetype plugin indent on     " required!
set t_Co=256             "256 colors
colorscheme zenburn

for file in split(glob($HOME . '/.vim/vimrc/*\.vim'), '\n')
  execute ':source ' . file
endfor
for file in split(glob($HOME . '/.vim/private/*\.vim'), '\n')
  execute ':source ' . file
endfor

