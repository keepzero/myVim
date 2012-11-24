" set line number
set nu

" set no compatible and syntax
set nocompatible
syntax on

" set colorscheme 
if has("gui_running")
    colorscheme lucius
else
    colorscheme desert
    set guifont=Consolas:h10:cANSI
endif

" Windows specific
if (has("win32") || has("win64"))
    let g:iswindows = 1
    set guifont=Consolas:h10:cANSI
else
    let g:iswindows = 0
endif

" autocmd
if has("autocmd")
    " autoload filetype plugin
    filetype plugin on
    " auto test filetype and load settings
    filetype plugin indent on

    " Python no tab
    autocmd FileType python setlocal et | setlocal sta | setlocal sw=4

    "autocmd BufNewFile *.py 0r ~/.vim/mode.py
else
    set autoindent  "always set autoindenting on
endif

" all tabs to expand to four spaces
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4

" <leader> key by default it's mapped to \
let mapleader = ","

" ##### minibufexpl.vim #####
" <C-hjkl> minibuffer switch window
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1 
" <C-TAB> and <C-S-TAB> switch buffer
let g:miniBufExplMapCTabSwitchBufs = 1
" compatible with TagList 
let g:miniBufExplModSelTarget = 1
