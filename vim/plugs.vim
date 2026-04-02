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
" ALE (Asynchronous Lint Engine), integrates external syntax checkers
Plug 'dense-analysis/ale'
" Recommended settings
let g:ale_linters = { 'go': ['gopls'] }
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'] }
let g:ale_fix_on_save = 1

" Jump to previous lint error/warning
nnoremap <silent> <leader>k <Plug>(ale_previous_wrap)
" Jump to next lint error/warning
nnoremap <silent> <leader>j <Plug>(ale_next_wrap)
" Show full detail of the current lint error/warning
nnoremap <silent> <leader>d :ALEDetail<CR>

" Undotree, visualizes the Vim undo tree
Plug 'mbbill/undotree'
nnoremap <leader>u :UndotreeToggle<CR>

" Sleuth.vim, automatically adjust 'shiftwidth' and 'expandtab'
Plug 'tpope/vim-sleuth'

" Repeat.vim, lets entire plugin commands be repeated
Plug 'tpope/vim-repeat'

" Surround.vim, provides mappings to modify pairs of quotes, {[(, tags, and more
" Usage:
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
let g:airline#extensions#ale#enabled = 1

" Session, session management
" Usage: SaveSession, OpenSession, RestartVim, CloseSession, DeleteSession
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
let g:session_autosave = 'no'
" Save current session to Session.vim
nnoremap <leader>S :mksession! Session.vim<CR>

" ---- Tool Integrations ----
" Signify, show diffs in the gutter for multiple VCSs.
Plug 'mhinz/vim-signify'

" Fugitive, adds Git features
Plug 'tpope/vim-fugitive'

" Fzf
if !empty(glob('/usr/local/opt/fzf/plugin/fzf.vim'))
    Plug '/usr/local/opt/fzf'
elseif !empty(glob('/opt/homebrew/opt/fzf/plugin/fzf.vim'))
    Plug '/opt/homebrew/opt/fzf'
else
    Plug 'junegunn/fzf', { 'dir': '~/.fzf',
                \ 'do': './install --all --no-update-rc --no-zsh --no-fish' }
endif
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :Files<CR>

" ---- Programming Languages ----
" Golang tools
Plug 'fatih/vim-go'
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

" Rust tools
Plug 'rust-lang/rust.vim'
let g:rustfmt_autosave = 1

" MatchTagAlways, highlight matching tags in HTML and XML
Plug 'Valloric/MatchTagAlways'

" ---- Color Schemes ----
Plug 'tomasr/molokai'

call plug#end()
