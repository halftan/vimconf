set nocompatible                " Be iMproved

" Set POSIX compatible shell
if &shell =~# 'fish$'
    set shell=sh
endif

"Persistent undo
set undofile
set undolevels=1000

" Backup
set backup

set history=1000
set modeline
set clipboard+=unnamed
set mouse=a
set updatetime=2000

set completeopt=menuone,preview,noinsert,noselect
set complete-=i

set autoindent
set smarttab

" set expandtab
set rnu
set hlsearch
set incsearch

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" set autochdir
set laststatus=2
set showmatch
set list
set textwidth=0
set wrapmargin=0
set wrap
set nrformats-=octal
set display+=lastline

set ttimeout timeoutlen=400 ttimeoutlen=100

set ignorecase
set smartcase

set switchbuf+=usetab,newtab

if v:version > 703 || v:version == 703 && has("patch541")
    set formatoptions+=j " Delete comment character when joining commented lines
endif

"Encode
set fencs=ucs-bom,utf-8,euc-cn,sjis,euc-jp,default,latin1
set fenc=utf-8 nobomb ff=unix
set encoding=utf-8
if has("win32")
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

if &encoding ==# 'latin1' && has('gui_running')
    set encoding=utf-8
endif

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
" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
    set t_Co=16
endif
" set t_vb=1

set viewoptions+=slash,unix
set viewoptions-=options


" NeoBundle Here
if has('vim_starting')
"     set rtp+=$HOME/.vim/bundle/neobundle.vim/
    set rtp+=/usr/local/opt/fzf
endif

if $USER != "root"
    call plug#begin(expand('~/.vim/bundle/'))
else
    if has("mac")
        call plug#begin(expand('~/.vim/bundle/'))
    else
        call plug#begin(expand('~/.vim/bundle/'))
    endif
endif

" Let NeoBundle manage NeoBundle
" NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
" NeoBundle 'Shougo/vimproc.vim', {
"             \ 'build' : {
"             \       'windows' : 'make -f make_mingw32.mak',
"             \       'cygwin' : 'make -f make_cygwin.mak',
"             \       'mac' : 'make -f make_mac.mak',
"             \       'unix' : 'make -f make_unix.mak',
"             \       'linux': 'make',
"             \   },
"             \ }

if has('mac')
    Plug 'Shougo/vimproc.vim', { 'do': 'make -f make_mac.mak' }
else
    Plug 'Shougo/vimproc.vim', { 'do': 'make' }
endif

" Libraries
" NeoBundle 'L9'
Plug 'xolox/vim-misc'
Plug 'vim-scripts/progressbar-widget'

" Completion
Plug 'Valloric/YouCompleteMe'
" Plug 'phpvim/phpcd.vim', { 'for': 'php' }
" if has('nvim')
"     Plug 'Shougo/deoplete.nvim'
"     Plug 'Shougo/neco-vim'
"     Plug 'Shougo/neco-syntax'
"     Plug 'zchee/deoplete-go'
" else
"     Plug 'Valloric/YouCompleteMe'
" endif
" NeoBundle 'osyo-manga/vim-marching'
" Plug 'marijnh/tern_for_vim', { 'for': 'javascript' }
Plug 'xolox/vim-lua-ftplugin', { 'for': 'lua' }
" NeoBundle 'othree/html5.vim'
" NeoBundleLazy 'm2mdas/phpcomplete-extended'
" Plug 'shawncplus/phpcomplete.vim'

" Editing
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/vim-easy-align'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-endwise'
Plug 'AndrewRadev/splitjoin.vim'
" Plug 'jiangmiao/auto-pairs'
" Plug 'rdnetto/YCM-Generator', { 'for': ['c', 'cpp'], 'branch': 'stable' }
if has('nvim')
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
else
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    " Plug 'Shougo/neosnippet'
    " Plug 'Shougo/neosnippet-snippets'
endif
" Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim', { 'for': ['xml', 'html', 'php'] }
" Plug 'xolox/vim-easytags'

" Navigating
Plug 'Lokaltog/vim-easymotion'
" Plug 'mileszs/ack.vim'
Plug 'ag.vim'
Plug 'majutsushi/tagbar'
" Plug 'spolu/dwm.vim'

" Tools & wrappers
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-unimpaired'
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'eruby'] }
Plug 'osyo-manga/vim-monster', { 'for': ['ruby', 'eruby'] }
" Plug 'tpope/vim-rails.git'
" Plug 'tpope/vim-rbenv'
Plug 'xuhdev/SingleCompile'
" Plug 'DBGp-X-client'
Plug 'joonty/vdebug'
Plug 'hlissner/vim-forrestgump'
if has('mac')
    Plug 'rizzatti/dash.vim'
endif
" PlugLazy 'shime/vim-livedown', {
"             \ 'autoload' : {
"             \     'filetypes' : ['markdown'],
"             \    },
"             \ }

" Fuzzy search
Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf.vim'
" Plug 'Shougo/unite.vim'
" Plug 'Shougo/unite-outline'
" Plug 'Shougo/unite-help'
" Plug 'Shougo/neomru.vim'

" Project drawer
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
" Plug 'Shougo/vimfiler'

" Syntax linter
Plug 'scrooloose/syntastic'

" Visual helpers
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-peekaboo'
" Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Plug 'bling/vim-bufferline'


" Filetype plugins & syntaxes
Plug 'sheerun/vim-polyglot'
Plug '2072/PHP-Indenting-for-VIm'
" Plug 'pangloss/vim-javascript'
Plug 'dag/vim-fish'
Plug 'fatih/vim-go'
Plug 'superbrothers/vim-vimperator'

" Color schemes
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'w0ng/vim-hybrid'

" Text Objects
Plug 'wellle/targets.vim'
Plug 'matchit.zip'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'          "ii ai
" Plug 'kana/vim-textobj-line'            "al il
" Plug 'kana/vim-textobj-entire'          "ae ie
Plug 'bkad/CamelCaseMotion'             ",w ,b
Plug 'argtextobj.vim'                   "via vaa da ca
Plug 'nelstrom/vim-textobj-rubyblock'   "vir var
Plug 'lucapette/vim-textobj-underscore' " a_, i_


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

call plug#end()

" filetype plugin indent on     " required!
" syntax enable

set path+=$PWD/include,$PWD/../include,/usr/local/include,/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1

" NeoBundleCheck

if has("gui_running")
    " Solarized theme
    if has("win32")
        set guifont=DejaVu\ Sans\ Mono:h11,Consolas:h11
    elseif has("mac")
        set guifont=Inconsolata-dz\ For\ Powerline:h12
    else
        set guifont=Inconsolata\ For\ Powerline\ 12
        " set guifont=DejaVu\ Sans\ Mono\ 10,Consolas\ 10
    endif
    set lines=50 columns=120
    set guioptions-=T
    " set guioptions-=r
    set guioptions-=m    "隐藏菜单栏
    colorscheme hybrid
else
    set background=dark
    set t_Co=256
    colorscheme hybrid
endif

augroup cursorline
    autocmd WinLeave * set nocursorline
    autocmd WinEnter * set cursorline
    autocmd InsertEnter * set nocursorline
    autocmd InsertLeave * set cursorline
augroup END

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

set spellfile=$HOME/.vim/spell/en.utf-8.add
set spelllang=en_us


"-----------------------------------
"  Fancy fonts
"-----------------------------------
set list " Show these tabs and spaces and so on
set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:· " Change listchars
set linebreak " Wrap long lines at a blank
set showbreak=↪  " Change wrap line break


" FileType specifies Here -------

" au BufNewFile,BufRead *.cpp set syntax=cpp11

set sw=4 ts=4 sts=4 et
set shiftround

augroup filetype_indent
    au FileType python,vim,c,cpp setl sw=4 ts=4 sts=4 et
    au FileType make,mkd,markdown setl sw=4 ts=4 sts=4 noet
    au FileType ruby,eruby,yaml setl sw=2 ts=2 sts=2 et
    au FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
    au FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
    au FileType coffee,jade setl sw=2 ts=2 sts=2 et
    au FileType asm setl sw=4 ts=4 sts=4 noet
    au FileType neosnippet setl noet

    au FileType gitcommit setlocal spell
augroup END

" FileType specs End ----------

augroup filetype_specs
    " au FileType c,cpp,python NeoBundleSource "YouCompleteMe"
    " au FileType php NeoBundleSource "m2mdas/phpcomplete-extended"
    " au FileType lua NeoBundleSource "vim-lua-ftplugin"
    " au FileType javascript NeoBundleSource "marijnh/tern_for_vim"
    au FileType html let g:delimitMate_matchpairs = "(:),[:],{:},<:>"
augroup END

" UltiSnips config Here ------------

let g:UltiSnipsEditSplit = "vertical"
" let g:UltiSnipsSnippetsDir="~/.vim/bundle/vim-snippets/UltiSnips"
" let g:UltiSnipsDontReverseSearchPath="1"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   emmet                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:user_emmet_leader_key = '<c-e>'



" Supertab config Here --------------
" let g:SuperTabDefaultCompletionType = "context"


" Indent Guildes Here --------------
let g:indent_guides_guide_size = 1
" au VimEnter * IndentGuidesEnable

" Airline Here -------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#default#section_use_groupitems = 0
let g:airline#extensions#tabline#fnametruncate = 20

" easy motion leader key -----------------
" let g:EasyMotion_leader_key = '\'

" Vim-rspec Here ------------
let g:rspec_command = "!bundle exec rspec {spec}"

" NERDTree Here -------------
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize = 30
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_smart_startup_focus = 2

" YouCompleteMe ---------------
let g:ycm_confirm_extra_conf = 1

" NeoSnippets ----------------
let g:neosnippet#snippets_directory = "~/.vim/snips"
let g:neosnippet#edit_options_split = 1
let g:neosnippet#edit_options_vertical = 1

" NeoComplete ----------------
augroup OmniCompleteOpts
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
    " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    " autocmd FileType php setlocal omnifunc=phpcd#CompletePHP
augroup END

if (!has('gui'))
    let g:acp_enableAtStartup = 0
endif
let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_auto_select = 0
" let g:deoplete#disable_auto_complete = 1
" let g:deoplete#manual_completion_start_length = 0
" let g:deoplete#auto_completion_start_length = 3

" let g:deoplete#enable_smart_case = 1
" let g:deoplete#sources#syntax#min_keyword_length = 3
" let g:deoplete#lock_buffer_name_pattern = '\*ku\*'

let g:deoplete#omni#input_patterns = {}
" let g:deoplete#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:deoplete#omni#input_patterns.java = '[^. *\t]\.\w*'
let g:deoplete#omni#input_patterns.php = '\h[a-zA-Z_]*|[^. \t]->(.*)?|\h\w*::(.*)?'

" let g:deoplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'
" let g:deoplete#force_omni_input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
" let g:deoplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

let g:deoplete#sources = {}
let g:deoplete#sources#go = 'vim-go'
let g:deoplete#sources._ = ['buffer', 'file', 'ultisnips']
let g:deoplete#sources.php = ['buffer', 'file', 'ultisnips', 'omni']

" -------------
" vim-marching
" -------------
let g:marching_clang_command = "/usr/bin/clang"
let g:marching#clang_command#options = {
            \ "cpp" : "-std=gnu++1y"
            \}
let g:marching_include_paths = [
            \ "/usr/include/c++/4.9.2"
            \]
let g:marching_enable_neocomplete = 1

" -------------
" Syntastic
" -------------
let g:syntastic_aggregate_errors = 1
" C++ Options
let g:syntastic_check_header = 1
let g:syntastic_cpp_include_dirs = ['/usr/include/c++/4.2.1', '/usr/include', '/usr/local/include',
            \ '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1',
            \ '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/7.0.2/include',
            \ '/usr/local/Cellar/boost/1.60.0_1'
            \ ]
let g:syntastic_cpp_checkers = ["clang++"]
let g:syntastic_cpp_compiler = "clang++"
let g:syntastic_cpp_compiler_options = '-std=c++11'
" Python Options
let g:syntastic_python_checkers = ['pylint']
" PHP Options
let g:syntastic_php_checkers = ['phpmd', 'php']
" JS Options
let g:syntastic_javascript_checkers = ['jslint']

let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-", " proprietary attribute \"bs-"]

" Tagbar ----------------
let g:tagbar_left = 0

set foldmethod=marker
set foldlevel=999

"===== tags ====="
set tags+=.tags,vendortags;

" easytags ---------------
let g:easytags_updatetime_min = 4000
let g:easytags_async = 1
let g:easytags_dynamic_files = 1
let g:easytags_auto_highlight = 0
let g:easytags_auto_update = 0

" phpcomplete -------------
let g:phpcomplete_index_composer_command = "composer"

" Unite -------------------
let g:unite_source_history_yank_enable = 1
" call unite#filters#matcher_default#use(['matcher_fuzzy'])

au FileType unite call s:unite_settings()
function! s:unite_settings()
    imap <buffer> <C-j> <Plug>(unite_select_next_line)
    imap <buffer> <C-k> <Plug>(unite_select_previous_line)
endfunction

" VimFiler ----------------
" let g:vimfiler_as_default_explorer = 1

" call vimfiler#custom#profile('default', 'context', {
" \   'safe' : 0,
" \   'split_action' : 'tabopen',
" \})

" delimitMate =================
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
let g:delimitMate_jump_expansion = 1
let g:delimitMate_balance_matchpairs = 1
let g:delimitMate_matchpairs = "(:),[:],{:}"

" VDebug =====================
let g:vdebug_options= {
\    "port" : 10000,
\    "server" : 'localhost',
\    "timeout" : 20,
\    "watch_window_style": "compact",
\}

" Golang ================
let g:go_fmt_command = "goimports"

" Eclim ================
let g:EclimCompletionMethod = 'omnifunc'
let g:EclimFileTypeValidate = 0

" HTML indent ===========
let g:html_exclude_tags = ['html', 'body', 'style', 'script']
" let g:html_indent_inctags = ['th', 'td']
" let g:html_indent_tags = 'th\|td'
let g:polyglot_disabled = ['coffee-script']

" omni completion ----

"======= OmniCompeleteCPP ========"
" nmap <F11> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" let OmniCpp_NamespaceSearch = 2
" let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD" ]
" let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters

" automatically open and close the popup menu / preview window
" au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
" let OmniCpp_SelectFirstItem = 2
" let OmniCpp_LocalSearchDecl = 1
" set completeopt=menu,menuone,preview


" :Tlist              调用TagList
" let Tlist_Show_One_File=0                    " 只显示当前文件的tags
" let Tlist_Exit_OnlyWindow=1                  " 如果Taglist窗口是最后一个窗口则退出Vim
" let Tlist_File_Fold_Auto_Close=1             " 自动折叠

" Load other configurations
for f in split(glob($HOME.'/.vim/vimrc.d/*.vim'), '\n')
    exe 'source '.f
endfor

let g:markdown_fmt_autosave = 0

call camelcasemotion#CreateMotionMappings(',')
