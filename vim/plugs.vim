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

" ---- Vim Additions ----
" Syntastic, integrates external syntax checkers
Plug 'vim-syntastic/syntastic'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Additional statusline changes are in the vimrc

" Undotree, visualizes the Vim undo tree
Plug 'mbbill/undotree'
nnoremap <leader>u :UndotreeToggle<CR>

" Sleuth.vim, automatically adjust 'shiftwidth' and 'expandtab'
Plug 'tpope/vim-sleuth'

" Repeat.vim, lets entire plugin commands be repeated
Plug 'tpope/vim-repeat'

" Surround.vim, provides mappings to modify pairs of quotes, {[(, tags, and more
" Examples:
"   cs"'  - Change " to '
"   ds"   - Delete "
"   ysiw" - Surround word with "
Plug 'tpope/vim-surround'

" Commentary.vim, quickly toggle comments
" Usage:
"   gcc  - Toggle comment on line
"   gciw - Toggle comment in word (or any other word object)
Plug 'tpope/vim-commentary'

Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1

Plug 'jeffkreeftmeijer/vim-numbertoggle'
set number relativenumber
nnoremap <leader>r :set number relativenumber!<CR>

" ---- Tool Integrations ----
" Gitgutter, shows a git diff in the 'gutter'
Plug 'airblade/vim-gitgutter'

" Fugitive, adds Git features
Plug 'tpope/vim-fugitive'

" Fzf
if !empty(glob('/usr/local/opt/fzf/plugin/fzf.vim'))
    Plug '/usr/local/opt/fzf'
else
    Plug 'junegunn/fzf', { 'dir': '~/.fzf',
                \ 'do': './install --all --no-update-rc --no-zsh --no-fish' }
endif
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :Files<CR>

" ---- Programming Languages ----
" Golang tools
Plug 'fatih/vim-go'

" ---- Color Schemes ----
Plug 'tomasr/molokai'

call plug#end()
