" Load other configurations
for f in split(glob($HOME.'/.vim/vimrc.d/*.vim'), '\n')
    exe 'source '.f
endfor

"Persistent undo
set undofile
set undolevels=1000

" Backup
set backup

set history=1000
set modeline
set clipboard+=unnamed
set mouse=a
set timeoutlen=500
let g:easytags_updatetime_min = 1000
set updatetime=2000

set completeopt+=longest
set completeopt-=preview

set autoindent
set smartindent
" set expandtab
set nu
set hlsearch
set autochdir
set laststatus=2
set showmatch
set list
set textwidth=0
set wrapmargin=0
set wrap

set ignorecase
set smartcase


"Encode
set fenc=UTF-8
set encoding=UTF-8
if has("win32")
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

" 解决consle输出乱码
    language messages zh_CN.UTF-8
    set ambiwidth=double
endif


" Set directories
function! InitializeDirectories()
    let parent=$HOME
    let prefix='.vim'
    let dir_list={
                \ 'backup': 'backupdir',
                \ 'view': 'viewdir',
                \ 'swap': 'directory',
                \ 'undo': 'undodir',
                \ 'cache': '',
                \ 'session': ''}
    for [dirname, settingname] in items(dir_list)
        let directory=parent.'/'.prefix.'/'.dirname.'/'
        if !isdirectory(directory)
            if exists('*mkdir')
                call mkdir(directory, 'p')
            else
                echo 'Warning: Unable to create directory: '.directory
            endif
        endif
        if settingname!=''
            exec 'set '.settingname.'='.directory
        endif
    endfor
endfunction
call InitializeDirectories()


autocmd BufWinLeave *.* silent! mkview " Make Vim save view (state) (folds, cursor, etc)
autocmd BufWinEnter *.* silent! loadview " Make Vim load view (state) (folds, cursor, etc)

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=


"------------------------------------
"    platform specific settings
"------------------------------------
"
" On Windows, also use .vim instead of vimfiles
if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

if has("gui") && !has("win32")
    set listchars=tab:\|_,trail:·
else
    set listchars=tab:\|_,trail:*
endif

set viewoptions+=slash,unix
set viewoptions-=options

syntax enable
syntax on



" NeoBundle Here
if has('vim_starting')
    set nocompatible                " Be iMproved
    set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif

if $USER != "root"
    call neobundle#begin(expand('~/.vim/bundle/'))
else
    call neobundle#begin(expand('/home/halftan/.vim/bundle/'))
endif

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \       'windows' : 'make -f make_mingw32.mak',
            \       'cygwin' : 'make -f make_cygwin.mak',
            \       'mac' : 'make -f make_mac.mak',
            \       'unix' : 'make -f make_unix.mak',
            \       'linux': 'make',
            \   },
            \ }

" Libraries
" NeoBundle 'L9'
NeoBundle 'xolox/vim-misc'

" Completion
NeoBundle 'Valloric/YouCompleteMe'
" NeoBundleLazy 'marijnh/tern_for_vim'
" NeoBundleLazy 'xolox/vim-lua-ftplugin'

" Editing
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'Raimondi/delimitMate'
" NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'xolox/vim-easytags'

" Navigating
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'ag.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'spolu/dwm.vim'

" Tools & wrappers
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'mbbill/undotree'
" NeoBundle 'sjl/gundo.vim'
NeoBundle 'myusuf3/numbers.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-rails.git'
NeoBundle 'tpope/vim-rbenv'
NeoBundle 'xuhdev/SingleCompile'

" Fuzzy search
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite-help'

" Project drawer
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'Shougo/vimfiler'

" Syntax linter
NeoBundle 'scrooloose/syntastic'

" Visual helpers
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'bling/vim-airline'
NeoBundle 'halftan/vim-bufferline'


" Filetype plugins & syntaxes
NeoBundle 'sheerun/vim-polyglot'

" Color schemes
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'
NeoBundle 'w0ng/vim-hybrid'

" Text Objects
NeoBundle 'wellle/targets.vim'
" NeoBundle 'matchit.zip'
" NeoBundle 'kana/vim-textobj-user'
" NeoBundle 'kana/vim-textobj-indent'          "ii ai
" NeoBundle 'kana/vim-textobj-line'            "al il
" NeoBundle 'kana/vim-textobj-entire'          "ae ie
NeoBundle 'bkad/CamelCaseMotion'             ",w ,b
" NeoBundle 'argtextobj.vim'                   "via vaa da ca
" NeoBundle 'nelstrom/vim-textobj-rubyblock'   "vir var
" NeoBundle 'lucapette/vim-textobj-underscore' " a_, i_


""""""""""""""""
"  Never used  "
""""""""""""""""

" NeoBundle 'ervandew/supertab'
" NeoBundle 'heartsentwined/vim-ember-script'
" NeoBundle 'FuzzyFinder'
" non github repos
" NeoBundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
" NeoBundle 'file:///Users/gmarik/path/to/plugin'
" ...
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleSearch(!) foo - search(or refresh cache first) for foo
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

call neobundle#end()

filetype plugin indent on     " required!

NeoBundleCheck

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
    set lines=50 columns=120
    set guioptions-=T
    " set guioptions-=r
    set guioptions-=m    "隐藏菜单栏
else
    set t_Co=256
    colorscheme solarized
    set background=dark
endif

autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline
set wildmenu " Show list instead of just completing
set wildmode=list:longest,full " Use powerful wildmenu
set shortmess=at " Avoids hit enter
set showcmd " Show cmd

set backspace=indent,eol,start " Make backspaces delete sensibly
set whichwrap+=<,>,[,] " Backspace and cursor keys wrap to
set virtualedit=block,onemore " Allow for cursor beyond last character
set scrolljump=5 " Lines to scroll when cursor leaves screen
set scrolloff=3 " Minimum lines to keep above and below cursor
set sidescroll=1 " Minimal number of columns to scroll horizontally
set sidescrolloff=10 " Minimal number of screen columns to keep away from cursor


"-----------------------------------
"  Fancy fonts
"-----------------------------------
set list " Show these tabs and spaces and so on
set listchars=tab:▸\ ,extends:❯,precedes:❮ " Change listchars
set linebreak " Wrap long lines at a blank
set showbreak=↪  " Change wrap line break


" FileType specifies Here -------

set sw=4 ts=4 sts=4 et
set shiftround
au FileType python,vim,c,cpp setl sw=4 ts=4 sts=4 et
au FileType make,mkd setl sw=4 ts=4 sts=4 noet
au FileType ruby,eruby,yaml setl sw=2 ts=2 sts=2 et
au FileType coffee setl sw=2 ts=2 sts=2 et
au FileType asm setl sw=4 ts=4 sts=4 noet

au FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
au FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" FileType specs End ----------


" au FileType javascript NeoBundleSource "tern_for_vim"
" au FileType c,cpp,python NeoBundleSource "YouCompleteMe"
" au FileType lua NeoBundleSource "vim-lua-ftplugin"

" UltiSnips config Here ------------

let g:UltiSnipsEditSplit = "horizontal"
let g:UltiSnipsExpandTrigger="<c-z>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:UltiSnipsDontReverseSearchPath="1"

" Supertab config Here --------------
" let g:SuperTabDefaultCompletionType = "context"

" Indent Guildes Here --------------
let g:indent_guides_guide_size = 1
" au VimEnter * IndentGuidesEnable

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

" Undotree Here --------------
nnoremap <F5> :UndotreeToggle<CR>

" Vim-rspec Here ------------
let g:rspec_command = "!bundle exec rspec {spec}"

" NERDTree Here -------------
let g:NERDTreeWinPos = "right"

" YouCompleteMe ---------------
let g:ycm_confirm_extra_conf = 0

" Syntastic ---------------
let g:syntastic_cpp_include_dirs = ['/usr/include/c++/4.8.2', '/usr/include']
let g:syntastic_check_header = 1
let g:syntastic_cpp_checkers = ["g++", "clang++"]
let g:syntastic_cpp_compiler = "clang++"
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'

" Tagbar ----------------
let g:tagbar_left = 1


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

