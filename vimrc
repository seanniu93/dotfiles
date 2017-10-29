" Vim settings for Linux
"===============================================================================

set nocompatible    " Use Vim settings instead of Vi


" PLUGINS
"===============================================================================

try
    source ~/.vim/plugs.vim
catch
    echom 'Plugin file missing or something went wrong'
    filetype plugin indent on
endtry


" EDITING
"===============================================================================

"---- Default tab settings ----
set tabstop=4       " How big a tab is
set softtabstop=4   " How many columns when tabbing
set shiftwidth=4    " How many columns for re-indents
set expandtab       " Turn tabs into spaces
set smarttab        " Indent according to shiftwidth

"---- Search settings ----
set incsearch       " Do incremental searching
set ignorecase      " Use case insensitive search
set smartcase       " Except when search query has capital letters

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Set wrapping for cursor keys
set whichwrap+=<,>,h,l,[,]

" Formatting options
set formatoptions+=r    " Automatically insert comment leader
set formatoptions+=j    " Delete comment character when joining commented

" Enable more tabs
set tabpagemax=100


" VISUAL
"===============================================================================

"---- Command bar stuff ----
set ruler           " Show the cursor position all the time
set number          " Show line numbers
set showcmd         " Display incomplete commands
set laststatus=2    " Always show status bar
"set noshowmode     " Hide the default mode text

" Set the command window height to 2 lines, to avoid many cases of having to
" 'press <Enter> to continue'
set cmdheight=2

"---- Color Scheme ----
try
    colorscheme tomorrow-night-bright
    "colorscheme molokai
    "let g:molokai_original=1
catch
    " Colorscheme not installed
    set background=dark " For using vim with a dark background
endtry

"---- 80th column marker ----
" Color names available at:
" http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
"set textwidth=80  " Limits text to 80 chars per column
if exists('+colorcolumn')  " Only in Vim 7.3+
    let &colorcolumn=join(range(81,256),",")    " Marks colum 81 and so on.
    highlight ColorColumn ctermbg=234 guibg=#1c1c1c
else
    autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"---- Syntax highlighting ----
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    if !exists("g:syntax_on")
        syntax enable
    endif
    set hlsearch
endif

" Folding color
hi Folded guibg=#262626 ctermbg=235

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\| \+\ze\t/

" Whitespace character symmbols. :set list! to toggle visibility
set listchars=tab:│·,trail:·,nbsp:·,precedes:←,extends:→
let &showbreak='↪ '

"---- Status line ----
" Resources:
"   http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
"   https://shapeshed.com/vim-statuslines/
set statusline=
set statusline+=%f            " filename (%t for tail only)
set statusline+=\ %y          " filetype
set statusline+=[%{&fileencoding?&fileencoding:&encoding},
set statusline+=%{&fileformat}]
set statusline+=%h            " help file flag
set statusline+=%m            " modified flag
set statusline+=%{fugitive#statusline()} " vim-fugitive
set statusline+=%=            " left/right separator
set statusline+=\[%{mode()}\] " current mode
set statusline+=[%l:%c]       " cursor line:column
set statusline+=[%P\ of\ %L]  " percent through file and total lines

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Change the status line color based on mode
if version >= 700
    highlight statusLine cterm=bold ctermfg=black ctermbg=green
    au InsertLeave * highlight StatusLine cterm=bold ctermfg=black ctermbg=green
    au InsertEnter * highlight StatusLine cterm=bold ctermfg=black ctermbg=red
endif


" BEHAVIOR
"===============================================================================

set history=50      " Keep 50 lines of command line history
set wildmenu        " Better command-line completion
set modeline        " If on, disallow insecure modeline
set startofline     " If on, prevent resetting cursor to beginning of line
"set clipboard=unnamed  " Use the system clipboard
set autoread        " Automatically reread changed files

"---- Code folding settings ----
set foldenable          " Enable folding
set foldlevelstart=10   " Open most fold by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " Fold based on indent level

"---- Backup settings ----
"set backup                  " keep a backup file
"set backupdir=~/.vim/backup " Set backup directory

" Enable persistent undo so that undo history persists across vim sessions
if has('persistent_undo')
    set undofile
    set undodir=~/.vim/undo
    silent call system('mkdir -p ' . &undodir)
endif

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" Set default splitting behavior
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

" For tmux compatibility
" tmux will send xterm-style keys when xterm-keys is on
" See: https://unix.stackexchange.com/a/34723
if &term =~ '^screen'
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif


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

" Toggle paste mode
nnoremap <leader>v :set paste!<CR>:set paste?<CR>

" Save session
nnoremap <leader>S :mksession! Session.vim<CR>

" Show listchars
nnoremap <leader>l :set list!<CR>


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
