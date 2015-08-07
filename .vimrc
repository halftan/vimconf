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
set updatetime=2000

set completeopt=menuone,preview

set autoindent
set smartindent
" set expandtab
set nu
set hlsearch
set incsearch
" set autochdir
set laststatus=2
set showmatch
set list
set textwidth=0
set wrapmargin=0
set wrap

set ignorecase
set smartcase


"Encode
set fenc=UTF-8 nobomb ff=unix
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

" if has("gui") && !has("win32")
"     set listchars=tab:\|_,trail:·
" else
"     set listchars=tab:\|_,trail:*
" endif

set viewoptions+=slash,unix
set viewoptions-=options


" NeoBundle Here
if has('vim_starting')
    set nocompatible                " Be iMproved
    set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif

if $USER != "root"
    call neobundle#begin(expand('~/.vim/bundle/'))
else
    if has("mac")
        call neobundle#begin(expand('/Users/halftan/.vim/bundle/'))
    else
        call neobundle#begin(expand('/home/halftan/.vim/bundle/'))
    endif
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
if has('nvim')
    NeoBundle 'Valloric/YouCompleteMe'
else
    NeoBundle 'Valloric/YouCompleteMe'
    " NeoBundle 'Shougo/neocomplete.vim'
endif
" NeoBundle 'osyo-manga/vim-marching'
NeoBundleLazy 'marijnh/tern_for_vim'
NeoBundleLazy 'xolox/vim-lua-ftplugin'
NeoBundle 'othree/html5.vim'
" NeoBundleLazy 'm2mdas/phpcomplete-extended'
NeoBundle 'shawncplus/phpcomplete.vim'

" Editing
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'Raimondi/delimitMate'
" NeoBundle 'jiangmiao/auto-pairs'
if has('nvim')
    NeoBundle 'SirVer/ultisnips'
    NeoBundle 'honza/vim-snippets'
else
    NeoBundle 'SirVer/ultisnips'
    NeoBundle 'honza/vim-snippets'
    " NeoBundle 'Shougo/neosnippet'
    " NeoBundle 'Shougo/neosnippet-snippets'
endif
" NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'mattn/emmet-vim'
" NeoBundle 'xolox/vim-easytags'

" Navigating
NeoBundle 'Lokaltog/vim-easymotion'
" NeoBundle 'mileszs/ack.vim'
NeoBundle 'ag.vim'
" NeoBundle 'majutsushi/tagbar'
" NeoBundle 'spolu/dwm.vim'

" Tools & wrappers
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'mbbill/undotree'
NeoBundle 'myusuf3/numbers.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
" NeoBundle 'tpope/vim-rails.git'
" NeoBundle 'tpope/vim-rbenv'
NeoBundle 'xuhdev/SingleCompile'
" NeoBundle 'DBGp-X-client'
NeoBundle 'joonty/vdebug'
NeoBundle 'hlissner/vim-forrestgump'

" Fuzzy search
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Shougo/unite.vim'
" NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite-help'
NeoBundle 'Shougo/neomru.vim'

" Project drawer
" NeoBundle 'scrooloose/nerdtree'
" NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'Shougo/vimfiler'

" Syntax linter
NeoBundle 'scrooloose/syntastic'

" Visual helpers
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'bling/vim-airline'
NeoBundle 'junegunn/vim-peekaboo'
" NeoBundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" NeoBundle 'bling/vim-bufferline'


" Filetype plugins & syntaxes
NeoBundle 'sheerun/vim-polyglot'
NeoBundle '2072/PHP-Indenting-for-VIm'

" Color schemes
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'
NeoBundle 'w0ng/vim-hybrid'

" Text Objects
NeoBundle 'wellle/targets.vim'
NeoBundle 'matchit.zip'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent'          "ii ai
" NeoBundle 'kana/vim-textobj-line'            "al il
" NeoBundle 'kana/vim-textobj-entire'          "ae ie
NeoBundle 'bkad/CamelCaseMotion'             ",w ,b
NeoBundle 'argtextobj.vim'                   "via vaa da ca
NeoBundle 'nelstrom/vim-textobj-rubyblock'   "vir var
NeoBundle 'lucapette/vim-textobj-underscore' " a_, i_


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
syntax enable

set path+=$PWD/include,$PWD/../include

NeoBundleCheck

if has("mac")
    let g:hybrid_use_Xresources = 1
    colorscheme hybrid
else
    colorscheme solarized
endif

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
    au FileType make,mkd setl sw=4 ts=4 sts=4 noet
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
    au FileType lua NeoBundleSource "vim-lua-ftplugin"
    au FileType javascript,html NeoBundleSource "marijnh/tern_for_vim"
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

" Vim easy align Here ---------------
vnoremap <silent> <Enter> :EasyAlign<cr>

" Airline Here -------------
let g:airline_powerline_fonts = 1
if has("gui_running")
    let g:airline_theme='hybrid'
else
    let g:airline_theme='luna'
end

" easy motion leader key -----------------
" let g:EasyMotion_leader_key = '\'

" Vim-rspec Here ------------
let g:rspec_command = "!bundle exec rspec {spec}"

" NERDTree Here -------------
let g:NERDTreeWinPos = "right"

" YouCompleteMe ---------------
let g:ycm_confirm_extra_conf = 1

" NeoSnippets ----------------
let g:neosnippet#snippets_directory = "~/.vim/snips"
let g:neosnippet#edit_options_split = 1
let g:neosnippet#edit_options_vertical = 1

" NeoComplete ----------------
augroup NeoComplete
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    " autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
augroup END

if (!has('gui'))
    let g:acp_enableAtStartup = 0
endif
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#disable_auto_complete = 1
let g:neocomplete#manual_completion_start_length = 0
let g:neocomplete#auto_completion_start_length = 3

let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'
let g:neocomplete#force_omni_input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

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
let g:syntastic_cpp_include_dirs = ['/usr/include/c++/4.9.2', '/usr/include']
let g:syntastic_cpp_checkers = ["clang++"]
let g:syntastic_cpp_compiler = "clang++"
let g:syntastic_cpp_compiler_options = '-std=c++1y'
" Python Options
let g:syntastic_python_checkers = ['pylint']
" PHP Options
let g:syntastic_php_checkers = ['phpmd', 'php']
" JS Options
let g:syntastic_javascript_checkers = ['jslint']

" Tagbar ----------------
let g:tagbar_left = 1

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
call unite#filters#matcher_default#use(['matcher_fuzzy'])

au FileType unite call s:unite_settings()
function! s:unite_settings()
    imap <buffer> <C-j> <Plug>(unite_select_next_line)
    imap <buffer> <C-k> <Plug>(unite_select_previous_line)
endfunction

" VimFiler ----------------
let g:vimfiler_as_default_explorer = 1

call vimfiler#custom#profile('default', 'context', {
\   'safe' : 0,
\   'split_action' : 'tabopen',
\})

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

" Eclim ================
let g:EclimCompletionMethod = 'omnifunc'
let g:EclimFileTypeValidate = 0

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

