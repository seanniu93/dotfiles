" Vim settings for OSX
" Updated: 2015/01/31
"===============================================================================

" VUNDLE
"===============================================================================

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible    " Be iMproved, required
filetype off        " Required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Alternatively, pass a path where Vundle should install bundles
"let path='~/some/path/here'
"call vundle#rc(path)

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"---- Installed Bundles ----

" Ag.vim, adds ag functionality (disabled)
"Plugin 'rking/ag.vim'

" Airline, a lighter weight Powerline
Plugin 'bling/vim-airline'
set ttimeoutlen=10
set encoding=utf-8
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1

" Ctrlp.vim, full path fuzzy file finder
Plugin 'kien/ctrlp.vim'
nnoremap <leader>p :CtrlP<CR>
let g:ctrlp_match_window='bottom,order:ttb'	" Order matching files ttb
let g:ctrlp_switch_buffer=0	" Always open files in new buffers
let g:ctrlp_working_path_mode=0	" Lets us change the working dir
"let g:ctrlp_user_command='ag %s -l --nocolor --hidden -g ""'	" Speed boost
" g:ctrlp_show_hidden and g:ctrlp_custom_ignore will not work with the above

" Fugitive, adds Git features
Plugin 'tpope/vim-fugitive'

" Gundo.vim, visualizes the Vim undo tree
Plugin 'sjl/gundo.vim'
nnoremap <leader>u :GundoToggle<CR>

" NerdCommenter, comment and uncomment code faster (disabled)
"Plugin 'scrooloose/nerdcommenter'

" NERDTree, a filesystem browser
Plugin 'scrooloose/nerdtree'
nnoremap <leader>n :NERDTreeToggle<CR>

" Powerline, a statusline plugin (disabled)
"Plugin 'Lokaltog/powerline'
"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
"if ! has('gui_running')
"	set ttimeoutlen=10
"	augroup FastEscape
"		autocmd!
"		au InsertEnter * set timeoutlen=0
"		au InsertLeave * set timeoutlen=1000
"	augroup END
"endif

" Repeat.vim, lets entire plugin commands be repeated
Plugin 'tpope/vim-repeat'

" Surround.vim, provides mappings to easily modify pairs of {[( and more
Plugin 'tpope/vim-surround'

" Tagbar, a visual tag browser
Plugin 'majutsushi/tagbar'
nnoremap <leader>t :TagbarToggle<CR>

" Tcomment, simple commenting and uncommenting
Plugin 'tomtom/tcomment_vim'

" Vim-pallete, a huge collection of colorschemes (disabled)
"Plugin 'gmist/vim-palette'

" Vim-easymotion, better cursor movement
Plugin 'Lokaltog/vim-easymotion'

" Vim-trailing-whitespace, nukes all unwanted whitespace
Plugin 'bronson/vim-trailing-whitespace'

" Golang support
Plugin 'fatih/vim-go'

"---- Individual color schemes ----

" Distinguished (disabled)
"Plugin 'Lokaltog/vim-distinguished'

" Jellybeans
Plugin 'nanotech/jellybeans.vim'

" Lucius (disabled)
"Plugin 'jonathanfilip/vim-lucius'

" Molokai
Plugin 'tomasr/molokai'

" Solarized
Plugin 'altercation/vim-colors-solarized'

" Tomorrow
Plugin 'chriskempson/vim-tomorrow-theme'

"---- End of installed bundles ----
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.

" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install (update) bundles
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.


" EDITING
"===============================================================================

"---- Default tab settings ----
set tabstop=4       " How big a tab is
set softtabstop=4   " How many columns when tabbing
set shiftwidth=4    " How many columns for re-indents
set noexpandtab
"set expandtab       " Turn tabs -> spaces

"---- Search settings ----
set incsearch       " do incremental searching
set ignorecase      " Use case insensitive search
set smartcase       " Except when search query has capital letters

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Set wrapping for cursor keys
set whichwrap+=<,>,h,l,[,]

" Formatting options
set formatoptions+=r    " Comment leader

" Enable more tabs
set tabpagemax=100


" VISUAL
"===============================================================================

"---- Command bar stuff ----
set ruler           " Show the cursor position all the time
set number          " Show line numbers
set showcmd         " Display incomplete commands
set laststatus=2    " Always show status bar
set noshowmode      " Hide the default mode text

" Set the command window height to 2 lines, to avoid many cases of having to
" 'press <Enter> to continue'
set cmdheight=2

"---- Color Scheme ----
try
	colorscheme tomorrow-night-bright
	"colorscheme molokai
catch
	" No color scheme"
	set background=dark " For using vim with a dark background
endtry
"let g:molokai_original=1
"set list listchars=tab:»·,trail:    " Display extra whitespace

"---- 80th column marker ----
" Color names available at:
" http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
"set textwidth=80  " Limits text to 80 chars per column
if exists('+colorcolumn')  " Only in Vim 7.3+
	"set colorcolumn=81
	let &colorcolumn=join(range(81,256),",")    " Marks colum 81 and so on.
	"hi ColorColumn ctermbg=233 guibg=#121212   " too dark
	hi ColorColumn ctermbg=234 guibg=#1c1c1c
	"autocmd colorscheme *  hi ColorColumn ctermbg=233 guibg=#121212
else
	autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"---- Syntax highlighting ----
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

" Folding color
hi Folded guibg=#262626 ctermbg=235

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\| \+\ze\t/


" BEHAVIOR
"===============================================================================

set history=50      " Keep 50 lines of command line history
set wildmenu        " Better command-line completion
set modeline        " If on, disallow insecure modeline
set startofline     " If on, prevent resetting cursor to beginning of line
"set clipboard=unnamed  " Use the system clipboard

"---- Code folding settings ----
set foldenable          " Enable folding
set foldlevelstart=10   " Open most fold by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " Fold based on indent level

"---- Backup settings ----
"set backup                  " keep a backup file
"set backupdir=~/.vim/backup " Set backup directory

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
	set mouse=a
endif

"---- Set default splitting behavior ----
set splitbelow
set splitright

" Allow edited buffers to be in non-visible buffers
"set hidden

" Don't use Ex mode, use Q for formatting
map Q gq

" Only do this part when compiled with support for autocommands.
if has("autocmd")
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
	set autoindent      " always set autoindenting on
endif " has("autocmd")

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
"set confirm


" MAPPINGS
"===============================================================================

" Map Y to behave like y$ (yank until EOL) instead of yy
nnoremap Y y$

" This unsets the 'last search pattern' register by hitting return
"nnoremap <CR> :noh<CR><CR>

" Map <C-L> (redraw screen) to also turn off search highlightin
noremap <silent> <C-L> :nohls<CR><C-L>

" Shortcuts for split views (nnoremap = nonrecursive, normal mode)
"nnoremap <C-J> <C-W>j
"nnoremap <C-K> <C-W>k
"nnoremap <C-L> <C-W>l  " <C-L> conflicts with redraw
"nnoremap <C-H> <C-W>h

" CTRL-U (and W) in insert mode deletes a lot. Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" See: http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

"---- Custom leader binds ----

" Save with less keystrokes
nnoremap <leader>s :update<CR>

" Save with less keystrokes, and also trim whitespace
"nnoremap <leader>s :%s/\s\+$/<CR>:update<CR>


" COMMANDS and FUNCTIONS
"===============================================================================

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if !exists("FixTrailingSpaces")
	command FixTrailingSpaces %s/\s\+$//
endif
