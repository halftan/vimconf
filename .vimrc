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

set nocompatible

" filetype off

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
" Bundle 'nono/vim-handlebars'
" Bundle 'heartsentwined/vim-ember-script'
Bundle 'ervandew/supertab'
Bundle 'slim-template/vim-slim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tpope/vim-haml'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'junegunn/vim-easy-align'
Bundle 'sjl/gundo.vim'
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'
Bundle 'tomtom/tcomment_vim'
Bundle 'myusuf3/numbers.vim'
Bundle 'Keithbsmiley/rspec.vim'
Bundle 'tomasr/molokai'
Bundle 'tpope/vim-rbenv'
Bundle 'thoughtbot/vim-rspec'
Bundle 'Rackup'

Bundle 'tpope/surround.vim'
Bundle 'tpope/vim-repeat'

" Text Objects
Bundle 'matchit.zip'
Bundle 'textobj-user'
Bundle 'bkad/CamelCaseMotion'
",w ,b
Bundle 'argtextobj.vim'
"via vaa da ca
Bundle 'vim-indent-object'
"vii vai
Bundle 'nelstrom/vim-textobj-rubyblock'
"vir var

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
        set guifont=Inconsolata\ For\ Powerline\ 12
    endif
    set lines=50 columns=160
    set guioptions-=T
    " set guioptions-=r
    set guioptions-=m    "隐藏菜单栏
else
    " Molokai colorscheme
    colorscheme molokai
    set background=dark
    set t_Co=256
endif

syntax enable
syntax on


" FileType specifies Here -------

au BufNewFile,BufRead *.cpp set syntax=cpp11

au FileType * setl sw=2 ts=2 sts=2 et
au FileType python setl sw=4 ts=4 sts=4 et
au FileType vim setl sw=4 ts=4 sts=4 et

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
if has("gui")
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

for f in split(glob('~/.vim/vimrc.d/*.vim'), '\n')
    exe 'source' f
endfor

" :Tlist              调用TagList
" let Tlist_Show_One_File=0                    " 只显示当前文件的tags
" let Tlist_Exit_OnlyWindow=1                  " 如果Taglist窗口是最后一个窗口则退出Vim
" let Tlist_File_Fold_Auto_Close=1             " 自动折叠

