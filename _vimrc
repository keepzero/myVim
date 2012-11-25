" encoding and fileencodings
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" set no vi compatible
set nocompatible
set guioptions=

" set syntax
syntax enable
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

" all tabs to expand to four spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" few options just make things better
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set noerrorbells
"set vb t_vb=
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set nu
"set relativenumber
set undofile

" <leader> key by default it's mapped to \
let mapleader = ","

" searching and moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" handle long lines
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" display invisible characters
set list
set listchars=tab:▸\ ",eol:¬

" force to use hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
"nnoremap k gk

" useful key map
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap ; :

" code not fold default
set foldmethod=syntax
set foldlevel=100
nnoremap <space> za

" shortcuts with Leader key
nnoremap <Leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <Leader>v V`]
nnoremap <Leader>w <C-w>v<C-w>l
nnoremap <Leader>q :q<CR>

" auto ClosePair
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {}<ESC>i
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

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

" ##### minibufexpl.vim #####
" <C-hjkl> minibuffer switch window
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" ##### man.vim #####
source $VIMRUNTIME/ftplugin/man.vim

" ##### tagbar.vim #####
nnoremap <Leader>tl :TagbarToggle<CR>
nnoremap <Leader>tb :TagbarToggle<CR>
let tagbar_left = 1
let tagbar_width = 25

" ##### nerdtree.vim #####
nnoremap <Leader>fl :NERDTreeToggle<CR>
nnoremap <Leader>nt :NERDTreeToggle<CR>
let NERDTreeWinSize = 25
let NERDTreeWinPos = "right"

" ##### grep.vim #####
nnoremap <Leader>sp :Grep -ir<CR>

" ##### indent_guides.vim #####
let g:indent_guides_start_level = 3
let g:indent_guides_guide_size = 1
nmap <Leader>ig :IndentGuidesToggle<CR>

" ##### conque shell #####
if(g:iswindows != 1)
    nmap <Leader>ct :ConqueTerm bash
    nmap <Leader>cvb :ConqueTermVSplit bash
    nmap <Leader>csb :ConqueTermSplit bash
endif
