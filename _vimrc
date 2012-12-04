" encoding and fileencodings
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" set no vi compatible
set nocompatible
set guioptions=menu

" set syntax
syntax enable
syntax on

" set auto indent
filetype on
filetype plugin on
filetype indent on

" set colorscheme
if has("gui_running")
    colorscheme lucius
else
    colorscheme desert
    set guifont=Consolas:h10:cANSI
endif
let t_Co=256

" platform detection
let g:iscygwin = 0
let g:iswindows = 0
let g:islinux = 0
let g:ismac = 0
if (has("win32") || has("win64"))
    let g:iswindows = 1
    set guifont=Consolas:h10:cANSI
elseif has("win32unix")
    let g:iscygwin = 1
else
    let g:islinux = 1
endif

" all tabs to expand to four spaces for default
set autoindent          "ai     cident smartindent
set tabstop=4           "ts
set shiftwidth=4        "sw     space for every indent
set expandtab           "et     expend tab to space
set softtabstop=4       "sts    backspace back num space
set nosmarttab          "sta

" few options just make things better
set scrolloff=3
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

" auto filetype detection
autocmd FileType python setlocal et sta sw=4 sts=4 foldmethod=indent
autocmd BufNewFile *.py 0r ~/.vim/mode/mode.py
"autocmd FileType python set tabstop=4 shiftwidth=4 expandtab omnifunc=pythoncomplete#Complete
"autocmd FileType c set tabstop=2 shiftwidth=2 expandtab omnifunc=ccomplete#Complete
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd BufNewFile,BufRead *.json set ft=javascript

" au BufRead
au BufRead,BufNewFile */etc/nginx/* set ft=nginx
au BufRead,BufNewFile */etc/init.d/* set ft=sh

" <leader> key by default it's mapped to \
let mapleader = ","

" searching and moving
set magic
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

" auto fcitx
if(g:islinux == 1)
    let g:input_toggle = 1
    function! Fcitx2en()
       let s:input_status = system("fcitx-remote")
       if s:input_status == 2
          let g:input_toggle = 1
          let l:a = system("fcitx-remote -c")
       endif
    endfunction

    function! Fcitx2zh()
       let s:input_status = system("fcitx-remote")
       if s:input_status != 2 && g:input_toggle == 1
          let l:a = system("fcitx-remote -o")
          let g:input_toggle = 0
       endif
    endfunction

    "set timeoutlen=260
    "autocmd InsertLeave * call Fcitx2en()
    "autocmd InsertEnter * call Fcitx2zh()
endif

" remember previous position
" Tell vim to remember certain things when we exit
" '10  :  marks will be remembered for up to 10 previously edited files
" "100 :  will save up to 100 lines for each register
" :20  :  up to 20 lines of command-line history will be remembered
" %    :  saves and restores the buffer list
" n... :  where to save the viminfo files
if(g:iswindows != 1)
    set viminfo='10,\"100,:20,%,n~/.viminfo
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

" ##### omni complete #####
set completeopt=longest,menuone,preview
set completeopt-=longest
inoremap <expr> <CR>        pumvisible()?"\<C-y>":"\<CR>"
inoremap <expr> <PageDown>  pumvisible()?"\<PageDown>\<C-p>\<C-n>":"\<PageDown>"
inoremap <expr> <PageUp>    pumvisible()?"\<PageUp>\<C-p>\<C-n>":"\<PageUp>"

" ##### minibufexpl.vim #####
" <C-hjkl> minibuffer switch window
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" ##### man.vim #####
source $VIMRUNTIME/ftplugin/man.vim
nmap <Leader>man :Man 3 <cword><CR>

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
if(g:islinux == 1)
    nmap <Leader>ct :ConqueTerm bash
    nmap <Leader>cvb :ConqueTermVSplit bash
    nmap <Leader>csb :ConqueTermSplit bash
endif

" ##### bash-support #####
let g:BASH_AuthorName   = 'KeepZero'
let g:BASH_Email        = 'i@keepzero.net'
let g:BASH_Company      = 'TripleZero'

" ##### powerline #####
let g:Powerline_symbols = 'unicode'
"let g:Powerline_colorscheme = 'skwp'
