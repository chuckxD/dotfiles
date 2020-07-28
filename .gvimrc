set guifont=Iconsolata:h14
colorscheme ir_black

" GUI Display 
set guioptions=
set guioptions+=A               " Same for modeless selection
set guioptions+=c               " Use console dialogs instead of popups
set guioptions+=e               " GUI tabs
set guioptions+=g               " Grayed-out menu items that aren't active
set guioptions+=i               " Use a Vim icon
set guioptions+=m               " Show the menu bar
set guioptions+=t               " Tear-off menus
set guioptions+=v               " Use a vertical layout for gui dialogs
set guicursor+=a:blinkon0       " Don't blink the cursor
set mousehide                   " Hide the mouse while typing
set columns=85                  " 80 + numberwidth + foldcolumn
set lines=40
set vb t_vb=                    " Disable visual and audible bell
set winaltkeys=no               " Don't use ALT to access the menu

" MacVim 
if has('gui_macvim')
  set fuoptions=maxvert,maxhorz " Full-screen mode uses the full screen
endif