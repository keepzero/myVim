set nocompatible               " be iMproved
filetype off                   " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins here:
"
" original repos on github
"Plugin 'tpope/vim-fugitive'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'fholgado/minibufexpl.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'majutsushi/tagbar'
Plugin 'edsono/vim-matchit'
Plugin 'jiangmiao/auto-pairs.git'
Plugin 'kien/ctrlp.vim'
"Plugin 'terryma/vim-multiple-cursors'
"Plugin 'AndrewRadev/splitjoin.vim'
"
" langs
"Plugin 'jimenezrick/vimerl'
Plugin 'kevinw/pyflakes-vim'
Plugin 'fatih/vim-go'
Plugin 'dgryski/vim-godef'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
"
" vim-scripts repos
Plugin 'Indent-Guides'
Plugin 'grep.vim'
Plugin 'genutils'
Plugin 'tagbar-phpctags'
Plugin 'Marks-Browser'
"
" colorschemes
Plugin 'jonathanfilip/vim-lucius'
Plugin 'tomasr/molokai'
"
" non github repos
"Plugin 'git://git.wincent.com/command-t.git'
" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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
set guifont=Monaco:h13

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
let tagbar_width = 35
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
let NERDTreeWinSize = 35
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

" ##### vim-go #####
let g:go_fmt_command = "goimports"
let g:go_snippet_engine = "snipmate"
