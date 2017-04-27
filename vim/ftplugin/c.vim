" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
	finish
endif
let b:did_ftplugin = 1

"---- Start of filetype plugin ----
set tabstop=8      " How wide a tab is
set softtabstop=8  " How many columns when tabbing
set shiftwidth=8   " How many columns for re-indents
set noexpandtab    " Use tabs

"setlocal cinoptions=>s,e0,n0,f0,{0,}0,^0,L-1,:s,=s,l0,b0,gs,hs,ps,ts,is,+s,c3,C0,/0,(2s,us,U0,w0,W0,m0,j0,J0,)20,*70,#0
"setlocal cinoptions=>s,e0,n0,f0,{0,}0,^0,L-1,:s,=s,l0,b0,gs,hs,ps,ts,is,+4,c3,C0,/0,(4,us,U0,w0,W0,m0,j0,J0,)20,*70,#0
setlocal cinoptions=:0,t0,+4,(4,u0

