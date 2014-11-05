set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Bundles here:
"
" original repos on github
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'fholgado/minibufexpl.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/vim-snippets"
Bundle 'garbas/vim-snipmate'
Bundle 'majutsushi/tagbar'
Bundle 'edsono/vim-matchit'
"Bundle 'jimenezrick/vimerl'
Bundle 'jonathanfilip/vim-lucius'
Bundle 'tomasr/molokai'
Bundle 'kevinw/pyflakes-vim'
Bundle 'jnwhiteh/vim-golang.git'
Bundle 'dgryski/vim-godef'
Bundle 'nsf/gocode', {'rtp': 'vim/'}
Bundle 'jiangmiao/auto-pairs.git'
Bundle 'kien/ctrlp.vim'
"Bundle 'terryma/vim-multiple-cursors'
"Bundle 'AndrewRadev/splitjoin.vim'
"
" vim-scripts repos
Bundle 'Indent-Guides'
Bundle 'grep.vim'
Bundle 'genutils'
Bundle 'tagbar-phpctags'
Bundle 'Marks-Browser'
"
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
" STEP: git submodule init; git submodule update

" set encodings
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" <leader> key by default it's mapped to \
let mapleader = ","

" gui settings
"set guioptions=menu
set guioptions=
"set guifont=Source\ Code\ Pro:h13

" set syntax
syntax enable
syntax on

" set colorscheme
let t_Co=256
colorscheme lucius
LuciusBlackLowContrast

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
set undodir=~/.vim/undodir
set undofile

" all tabs to expand to four spaces
set autoindent          "ai     cident smartindent
"set tabstop=4           "ts
"set shiftwidth=4        "sw     space for every indent
"set expandtab           "et     expend tab to space
"set softtabstop=4       "sts    backspace back num space
set nosmarttab          "sta

" code not fold default
set foldmethod=indent
set foldlevel=100
nnoremap <space> za

" auto language indent
autocmd FileType python,erlang,java,sh set ts=4 sw=4 et sts=4
autocmd FileType c,cpp set tabstop=8 shiftwidth=8 noexpandtab sts=8
autocmd FileType go set tabstop=4 shiftwidth=4 noexpandtab sts=4
autocmd FileType lua set tabstop=4 shiftwidth=4 noexpandtab sts=4
autocmd FileType html,javascript,yaml,css set tabstop=2 shiftwidth=2 expandtab sts=2
autocmd FileType text set ts=8 sts=8

" php doc
set runtimepath+=$HOME/.vim/doc/phpdoc
autocmd FileType php set tabstop=4 shiftwidth=4 noexpandtab sts=4
autocmd BufNewFile,BufRead *.ros,*.inc,*.php set keywordprg="help"
autocmd BufNewFile *.php 0r ~/.vim/mode/mode.php

" go-lang
autocmd FileType go autocmd BufWritePre <buffer> Fmt

" code template
autocmd BufNewFile *.py 0r ~/.vim/mode/mode.py
autocmd BufNewFile *.sh 0r ~/.vim/mode/mode.sh

" autocmd filetype
autocmd BufRead,BufNewFile *.json set ft=javascript
autocmd BufRead,BufNewFile */etc/nginx/* set ft=nginx
autocmd BufRead,BufNewFile */etc/init.d/* set ft=sh
autocmd BufRead,BufNewFile *.conf setlocal ts=4 sw=4 et sts=4

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

" handle long lines
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" display invisible characters
set listchars=tab:▸\ ,eol:¬
nnoremap <leader><tab> :set list<cr>

" force to use hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap j gj
"nnoremap k gk

" useful key map
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap ; :

" Emacs bind
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-w> <Esc>dbcl
inoremap <C-u> <Esc>d0cl
inoremap <C-k> <Esc>lC
inoremap <C-d> <Esc>ls

" shortcuts with Leader key
nnoremap <Leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <Leader>v V`]
nnoremap <Leader>w <C-w>v<C-w>l
nnoremap <Leader>q :q<CR>
nnoremap <Leader>md :w !Markdown.pl > %.html<CR><CR>

" split window shortcut
nnoremap <C-w>- <C-w>s<C-w>j
nnoremap <C-w>\| <C-w>v<C-w>l
noremap <C-J>     <C-W>j
noremap <C-K>     <C-W>k
noremap <C-H>     <C-W>h
noremap <C-L>     <C-W>l

" omni complete
set completeopt=longest,menuone,preview
set completeopt-=longest
inoremap <expr> <CR>       pumvisible()?"\<C-y>":"\<CR>"
inoremap <expr> <C-J>      pumvisible()?"\<PageDown>\<C-N>\<C-P>":"\<C-X><C-O>"
inoremap <expr> <C-K>      pumvisible()?"\<PageUp>\<C-P>\<C-N>":"\<C-K>"
inoremap <expr> <C-U>      pumvisible()?"\<C-E>":"\<C-U>" 

" man.vim
source $VIMRUNTIME/ftplugin/man.vim
nmap <Leader>man :Man 3 <cword><CR>

" Bundle plugin config

" ##### minibufexpl.vim #####
noremap <C-TAB>   :MBEbn<CR>
noremap <C-S-TAB> :MBEbp<CR>

" ##### tagbar.vim #####
nnoremap <Leader>tl :TagbarToggle<CR>
nnoremap <Leader>tb :TagbarToggle<CR>
let tagbar_left = 1
let tagbar_width = 30
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" ##### nerdtree.vim #####
nnoremap <Leader>fl :NERDTreeToggle<CR>
nnoremap <Leader>nt :NERDTreeToggle<CR>
let NERDTreeWinSize = 30
let NERDTreeWinPos = "right"

" ##### grep.vim #####
nnoremap <Leader>sp :Grep -ir<CR>

" ##### indent_guides.vim #####
let g:indent_guides_start_level = 3
let g:indent_guides_guide_size = 1
nmap <Leader>ig :IndentGuidesToggle<CR>
map <Leader>ch :call SetColorColumn()<CR>
function! SetColorColumn()
    let col_num = virtcol(".")
    let cc_list = split(&cc, ',')
    if count(cc_list, string(col_num)) <= 0
        execute "set cc+=".col_num
    else
        execute "set cc-=".col_num
    endif
endfunction

" ##### Marks Browser #####
let marksCloseWhenSelected = 1
nnoremap <Leader>mb :MarksBrowser<CR>

" ##### Godef #####
let g:godef_same_file_in_same_window = 1

" ##### CtrlP #####
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
