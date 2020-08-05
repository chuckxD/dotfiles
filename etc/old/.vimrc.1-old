" <3 graywh
syntax on
colorscheme ir_black "or graywh
set nocompatible
set clipboard=unnamed
set nocompatible
set nowrap
set number
set showmatch
set ttyfast
set title
set wrapmargin=0
set shiftwidth=2
set tabstop=8
set softtabstop=2
set expandtab
set formatoptions=cn
set fileformats=unix,mac,dos
set wildmenu
set wildmode=longest:full,full
" set dir=~/.vim/swap//,~/.vim/undo//,/tmp//,.
" set undofile
" set undolevels=100
" set undoreload=100

if has('autocmd') && exists(':filetype') == 2
  filetype plugin indent on
endif

if exists(':syntax') == 2
  syntax enable
  syntax sync fromstart
endif

" show spaces as dots
set listchars=
set listchars+=trail:·
set listchars+=extends:→
set listchars+=precedes:←
set listchars+=tab:»·
set list

" windows, buffers
set hidden
if exists('&switchbuf')
  set switchbuf=useopen
  if v:version >= 700
    set switchbuf+=usetab
  endif
endif
set splitbelow
set splitright

" window nav
nnoremap <silent> <Left>  <C-w>h
nnoremap <silent> <Right> <C-w>l
nnoremap <silent> <Up>    <C-w>k
nnoremap <silent> <Down>  <C-w>j
nnoremap <silent> <C-p> :CtrlPCurWD<CR>

if has("gui_vimr")
  nnoremap <silent><D-S-{> gT
  nnoremap <silent><D-S-}> gt
  nnoremap <silent><D-S><Right> :bnext<CR>
  nnoremap <silent><D-S><Left> :bprevious<CR>
  "nnoremap <D-h>  :bfirst<CR>
  "nnoremap <D-k>  :bnext<CR>
  "nnoremap <D-j>  :bprevious<CR>
  "nnoremap <D-l>  :blast<CR>
  "nnoremap <D-e>  :e<Space>
  "nnoremap <D-E>  :enew<CR>
endif

" remove white space on save
autocmd BufWritePre * :%s/\s\+$//e
" autocmd BufWritePre *.js exe "normal! gggqG\<C-o>\<C-o>"

" diff mode
if exists('&diffopt')
  set diffopt=filler
  set diffopt+=iwhite
  if v:version >= 700
    set diffopt+=vertical
    set diffopt+=foldcolumn:2
  endif
endif

" vim info
set laststatus=2                " Always display the statusline
set ruler                       " Show position even without status line
set showcmd                     " Show (partial) command in status line
set vb t_vb=                    " Disable visual and audible bell
set history=50                  " Keep 50 lines of command line history
set viminfo=
set viminfo+='100               " Remember 100 previously edited files' marks
set viminfo+=!                  " Remember some global variables
set viminfo+=h                  " Don't restore the hlsearch highlighting

" vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'prettier/vim-prettier'
Plugin 'sbdchd/neoformat'
Plugin 'vim-syntastic/syntastic'
Plugin 'isRuslan/vim-es6'
Plugin 'pangloss/vim-javascript'
" Plugin 'w0rp/ale'
" Plugin 'spolu/dwm.vim'
" Plugin 'roman/golden-ratio'
" SnipMate shit required by vim-es6
" Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate'
" Plugin 'honza/vim-snippets'
call vundle#end()

let g:airline#extensions#tabline#enabled = 1
let g:ctrlp_cmd = 'E'
" let b:ale_fix_on_save = 1
" let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace', 'eslint']
"
" CtrlP ignore
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" eslint syntastic stuff
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = 'npm run lint --'
" prettier
" autocmd BufWritePre *.js Neoformat
" autocmd BufWritePre,TextChanged,InsertLeave *.js Neoformat
" more prettier
" when running at every change you may want to disable quickfix
" let g:prettier#autoformat = 1
" let g:prettier#quickfix_enabled = 0
" let g:prettier#exec_cmd_async = 1
" autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
" vim-javascript
" https://vimawesome.com/plugin/vim-javascript
" let g:javascript_plugin_jsdoc = 1
" let g:javascript_plugin_ngdoc = 1

if !has('nvim')
  set ttymouse=xterm2
endif

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

if exists(':tnoremap')
  tnoremap <Esc> <C-\><C-n>
endif

if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

call dein#add('Shougo/denite.nvim')
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

call plug#begin('~/.vim/plugged')

Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
call plug#end()
let g:deoplete#enable_at_startup = 1

