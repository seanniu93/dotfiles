" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
	finish
endif
let b:did_ftplugin = 1

"---- Start of filetype plugin ----
set tabstop=2      " How wide a tab is
set softtabstop=2  " How many columns when tabbing
set shiftwidth=2   " How many columns for re-indents
set expandtab      " Use spaces
