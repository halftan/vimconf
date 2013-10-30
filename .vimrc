set nocompatible                " Be iMproved

if has("win32")
    let $VIMFILES=$HOME.'/vimfiles'
    let $V=$HOME.'/_vimrc'
    let $PATH='C:/Program Files (x86)/Git/bin;'.$PATH
    set path=.,,$GCC_LIB,$GCC_LIB/c++
else
    let $VIMFILES=$HOME.'/.vim'
    let $V=$HOME.'/.vimrc'
endif

"Persistent undo
set undofile
set undodir=$VIMFILES/\_undodir
set undolevels=1000

" filetype off

" NeoBundle Here
if has('vim_starting')
    set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif

if $USER != "root"
    call neobundle#rc(expand($HOME.'/.vim/bundle/'))
else
    call neobundle#rc(expand('/home/halftan/.vim/bundle/'))
endif

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc', {
            \ 'build' : {
            \       'windows' : 'make -f make_mingw32.mak',
            \       'cygwin' : 'make -f make_cygwin.mak',
            \       'mac' : 'make -f make_mac.mak',
            \       'unix' : 'make -f make_unix.mak',
            \   },
            \ }

" Libraries
NeoBundle 'L9'
NeoBundle 'xolox/vim-misc'

" Editing
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
NeoBundle 'xolox/vim-easytags'

" Navigating
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'ag.vim'
NeoBundle 'majutsushi/tagbar'

" Tools & wrappers
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'myusuf3/numbers.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-rails.git'
NeoBundle 'tpope/vim-rbenv'

" Fuzzy search
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite-help'

" Project drawer
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/vimfiler'

" Syntax linter
NeoBundle 'scrooloose/syntastic'

" Visual helpers
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'bling/vim-airline'
NeoBundle 'bling/vim-bufferline'


" Filetype plugins & syntaxes
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'tpope/vim-haml'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'Keithbsmiley/rspec.vim'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'Rackup'

" Color schemes
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'

" Text Objects
NeoBundle 'matchit.zip'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent'          "ii ai
NeoBundle 'kana/vim-textobj-line'            "al il
NeoBundle 'kana/vim-textobj-entire'          "ae ie
NeoBundle 'bkad/CamelCaseMotion'             ",w ,b
NeoBundle 'argtextobj.vim'                   "via vaa da ca
NeoBundle 'nelstrom/vim-textobj-rubyblock'   "vir var
NeoBundle 'lucapette/vim-textobj-underscore' " a_, i_


""""""""""""""""
"  Never used  "
""""""""""""""""

" NeoBundle 'ervandew/supertab'
" NeoBundle 'nono/vim-handlebars'
" NeoBundle 'heartsentwined/vim-ember-script'
" NeoBundle 'FuzzyFinder'
" non github repos
" NeoBundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
" NeoBundle 'file:///Users/gmarik/path/to/plugin'
" ...


filetype plugin indent on     " required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleSearch(!) foo - search(or refresh cache first) for foo
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

for f in split(glob($HOME.'/.vim/vimrc.d/*.vim'), '\n')
    exe 'source' f
endfor


set history=50
set scrolloff=3
set mouse=a

set updatetime=4000

if has("gui_running")
    " Solarized theme

    set background=light
    colorscheme solarized

    if has("win32")
        set guifont=DejaVu\ Sans\ Mono:h11,Consolas:h11
    elseif has("mac")
        set guifont=Monaco:h10
    else
        set guifont=Inconsolata-dz\ For\ Powerline\ 10
    endif
    set lines=50 columns=160
    set guioptions-=T
    " set guioptions-=r
    set guioptions-=m    "隐藏菜单栏
else
    set t_Co=256
    colorscheme elflord
    " set background=dark
endif

syntax enable
syntax on

set dir=$HOME/.vimswap//,/var/tmp//,/tmp//,.

" FileType specifies Here -------

au BufNewFile,BufRead *.cpp set syntax=cpp11

au FileType * setl sw=2 ts=2 sts=2 et
au FileType python setl sw=4 ts=4 sts=4 et
au FileType vim setl sw=4 ts=4 sts=4 et
au FileType c setl sw=4 ts=4 sts=4 et
au FileType cpp setl sw=4 ts=4 sts=4 et
au FileType make setl sw=4 ts=4 sts=4 noet

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1

" FileType specs End ----------

" UltiSnips config Here ------------

let g:UltiSnipsEditSplit = "horizontal"
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:UltiSnipsDontReverseSearchPath="1"

" Supertab config Here --------------
" let g:SuperTabDefaultCompletionType = "context"

" Easytag config Here --------------
let g:easytags_updatetime_min = 4000

" Indent Guildes Here --------------
let g:indent_guides_guide_size = 1
au VimEnter * IndentGuidesEnable

" Vim easy align Here ---------------
vnoremap <silent> <Enter> :EasyAlign<cr>

" Airline Here -------------
let g:airline_powerline_fonts = 1
if has("gui_running")
    let g:airline_theme='solarized'
else
    let g:airline_theme='luna'
end

" easy motion leader key -----------------
" let g:EasyMotion_leader_key = '\'

" Gundo Here --------------
nnoremap <F5> :GundoToggle<CR>

" Vim-rspec Here ------------
let g:rspec_command = "!bundle exec rspec {spec}"

" NERDTree Here -------------
let g:NERDTreeWinPos = "right"

" YouCompleteMe ---------------
" let g:ycm_confirm_extra_conf = 1

" Tagbar ----------------
let g:tagbar_left = 1

set ai
set smartindent
" set expandtab
set nu
set hlsearch
set autochdir
set laststatus=2
set showmatch
set cursorline
set list
if has("gui") && !has("win32")
    set listchars=tab:\|_,trail:·
else
    set listchars=tab:\|_,trail:*
endif
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
" let OmniCpp_NamespaceSearch = 2
" let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD" ]
" let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters

" automatically open and close the popup menu / preview window
" au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
" let OmniCpp_SelectFirstItem = 2
" let OmniCpp_LocalSearchDecl = 1
" set completeopt=menu,menuone,preview


"===== tags ====="
" set tags+=$VIMFILES/tags/cpp

" :Tlist              调用TagList
" let Tlist_Show_One_File=0                    " 只显示当前文件的tags
" let Tlist_Exit_OnlyWindow=1                  " 如果Taglist窗口是最后一个窗口则退出Vim
" let Tlist_File_Fold_Auto_Close=1             " 自动折叠

