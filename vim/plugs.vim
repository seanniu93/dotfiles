" Install Vim-Plug if it's not installed
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !echo 'Downloading vim-plug'
    !curl -fLo ~/.vim/autoload/plug.vim --create-dirs --stderr -
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Vim-Plug
" See: https://github.com/junegunn/vim-plug
" Usage:
"   PlugInstall [names] - Install plugins
"   PlugUpdate  [names] - Install or update plugins
"   PlugClean[!]        - Remove unused directories (bang version will clean
"                         without prompt)
"   PlugUpgrade         - Upgrade vim-plug itself
"   PlugStatus          - Check the status of plugins
"   PlugDiff            - Examine changes from the previous update and the
"                         pending changes
"   PlugSnapshot[!] [p] - Generate script for restoring the current snapshot
"                         of the plugins
call plug#begin('~/.vim/plugged')

" ==== Vim Additions ==== "

" NERD Commenter, quickly toggle comments
" For all documentation see `:help nerdcommenter
" Usage: All commands can have a [count] prefix and starts with the <leader> key
"   cc       - Comment out line
"   c<space> - Toggle comment
"   ci       - Invert comment
Plug 'scrooloose/nerdcommenter'

" Undotree, visualizes the Vim undo tree
Plug 'mbbill/undotree'
nnoremap <leader>u :UndotreeToggle<CR>


" ==== Tool Integration ==== "

Plug 'airblade/vim-gitgutter'

" Fugitive, adds Git features
Plug 'tpope/vim-fugitive'

" Fzf
if !empty(glob('/usr/local/opt/fzf/plugin/fzf.vim'))
	Plug '/usr/local/opt/fzf'
else
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
endif
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :Files<CR>


" ==== Programming Languages ==== "

" Golang tools
Plug 'fatih/vim-go'

call plug#end()
