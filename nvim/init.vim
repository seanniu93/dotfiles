" Neovim shim: reuse the existing ~/.vimrc and ~/.vim runtime.
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
