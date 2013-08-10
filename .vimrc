if has("win32")
    let $VIMFILES=$HOME.'/vimfiles'
    let $V=$HOME.'/_vimrc'
    set path=.,,$GCC_LIB,$GCC_LIB/c++
else
    let $VIMFILES=$HOME.'/.vim'
    let $V=$HOME.'/.vimrc'
endif

"Persistent undo
set undofile
set undodir=$VIMFILES/\_undodir
set undolevels=1000

set nocompatible
filetype off

" Vundle Here
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'vim-ruby/vim-ruby'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'jiangmiao/auto-pairs'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'SirVer/ultisnips'
Bundle 'kchmck/vim-coffee-script'
Bundle 'nono/vim-handlebars'
Bundle 'heartsentwined/vim-ember-script'
Bundle 'ervandew/supertab'
Bundle 'slim-template/vim-slim'
Bundle 'nathanaelkane/vim-indent-guides'

" vim-scripts repos
if has('unix')
endif
Bundle 'Rackup'
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'
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


set history=50
set scrolloff=3
set mouse=a


if has("gui_running")
    " Solarized theme

    set background=light
    colorscheme solarized

    " map control-tab to swap between tabs
    nmap <C-TAB> gt
    nmap <S-TAB> gT
    if has("win32")
        set guifont=DejaVu\ Sans\ Mono:h11,Consolas:h11
    elseif has("mac")
        set guifont=Monaco:h10
    else
        set guifont=WenQuanYi\ Micro\ Hei\ Mono\ 10,Monaco\ 10,DejaVu\ Sans\ Mono\ 10
    endif
    set lines=50 columns=160
    set guioptions-=T
    set guioptions-=r
"    set guioptions-=m    "隐藏菜单栏
else
    colorscheme desert
endif

syntax enable
syntax on


" FileType specifies Here -------

au BufNewFile,BufRead *.cpp set syntax=cpp11

au FileType * setl sw=2 ts=2 sts=2 et
au FileType python setl sw=4 ts=4 sts=4 et

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1

" FileType specs End ----------

" UltiSnips config Here ------------
let g:UltiSnipsEditSplit = "horizontal"
let g:UltiSnipsDontReverseSearchPath="1"

" Supertab config Here --------------
let g:SuperTabDefaultCompletionType = "context"

" Indent Guildes Here --------------
let g:indent_guides_guide_size = 1
au VimEnter * IndentGuidesEnable

set ai
set smartindent
" set expandtab
set nu
set ruler
set hlsearch
set autochdir
set laststatus=2
set showmatch
set cursorline
set linebreak
set nolist
set listchars=tab:\|\ ,
set textwidth=0
set wrapmargin=0
set wrap

set ignorecase
set smartcase

set nowritebackup
set nobackup
set foldmethod=syntax
set foldlevel=999

"Encode
set fenc=UTF-8
set encoding=UTF-8
set fileencodings=UTF-8,GBK,SHIFT-JIS,CP936,LATIN-1
if has("win32")
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif

" 解决consle输出乱码
if has('win32')
    language messages zh_CN.UTF-8
    set ambiwidth=double
endif

" omni completion ----

"======= OmniCompeleteCPP ========"
" map <C-F11> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
let OmniCpp_NamespaceSearch = 2
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD" ]
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
let OmniCpp_SelectFirstItem = 2
let OmniCpp_LocalSearchDecl = 1
set completeopt=menu,menuone,preview


"===== tags ====="
set tags+=$VIMFILES/tags/cpp

" :Tlist              调用TagList
" let Tlist_Show_One_File=0                    " 只显示当前文件的tags
" let Tlist_Exit_OnlyWindow=1                  " 如果Taglist窗口是最后一个窗口则退出Vim
" let Tlist_File_Fold_Auto_Close=1             " 自动折叠

" kk & jj                  保存文件并返回Normal模式 [插入模式]
imap kk <ESC>l
imap jj <ESC>l

" easy motion leader key
let g:EasyMotion_leader_key = '\'

" ======= 编译 && 运行 ======= "

" 编译源文件
func! CompileCode()
    exec "w"
    if &filetype == "c"
        exec "!gcc -Wall -g %<.c -o %< -D DEBUG"
    elseif &filetype == "cpp"
        exec "!g++ -Wall -g %<.cpp -o %< -std=c++0x -D DEBUG -D CPP0X"
    elseif &filetype == "java"
        exec "!javac %<.java"
    elseif &filetype == "haskell"
        exec "!ghc --make %<.hs -o %<"
    elseif &filetype == "lua"
        exec "!lua %<.lua"
    elseif &filetype == "perl"
        exec "!perl %<.pl"
    elseif &filetype == "python"
        exec "!python2 %<.py"
    elseif &filetype == "ruby"
        exec "!ruby %<.rb"
    elseif &filetype == "coffee"
        exec "!coffee -p %"
    endif
endfunc

" 运行可执行文件
func! RunCode()
    exec "w"
    if &filetype == "c" || &filetype == "cpp" || &filetype == "haskell"
        if has("win32")
            exec "! %<.exe"
        else
            exec "! ./%<"
        endif
    elseif &filetype == "java"
        exec "!java %<"
    elseif &filetype == "lua"
        exec "!lua %<.lua"
    elseif &filetype == "perl"
        exec "!perl %<.pl"
    elseif &filetype == "python"
        exec "!python2 %<.py"
    elseif &filetype == "ruby"
        exec "!ruby %<.rb"
    endif
endfunc

" Alt + C 一键保存、编译
nmap <m-c> :call CompileCode()<CR>
" imap <m-c> <ESC>:call CompileCode()<CR>
" vmap <m-c> <ESC>:call CompileCode()<CR>

" Alt + R 一键保存、运行
nmap <m-x> :call RunCode()<CR>
" imap <m-x> <ESC>:call RunCode()<CR>
" vmap <m-x> <ESC>:call RunCode()<CR>

" NERDTree shortcuts
nmap NT :NERDTree<CR>
