syntax enable

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set background=dark
set number
set showcmd

filetype indent on
set smartindent
set cindent

set colorcolumn=80

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\| \+\ze\t/
