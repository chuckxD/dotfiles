" Vim color scheme
"
" Name:        paper.vim
" Maintainer:  Hakan Ensari <hakan.ensari@papercavalier.com>
" License:     public domain
"
" A slightly toned-down mod of the Railscasts color scheme.
"
" [1] http://www.vim.org/scripts/script.php?script_id=1995

runtime colors/railscasts.vim
let colors_name = "paper"

hi NonText          guifg=#2B2B2B     guibg=#2B2B2B
hi VertSplit        guifg=#282828     guibg=#282828
hi StatusLine       guifg=#777777     guibg=#282828     gui=italic
hi StatusLineNC     guifg=#111111     guibg=#282828     gui=NONE

"make the line numbers more noticable
hi LineNr           guifg=DarkGrey    guibg=NONE        term=bold     cterm=NONE    ctermfg=DarkGrey    ctermbg=NONE    gui=NONE 
