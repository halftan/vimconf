let mapleader = "\<space>"

" Template
" nmap <Leader>

" Write with sudo
cmap w!! w !sudo tee > /dev/null %

" map control-tab to swap between tabs
" nmap <C-TAB> gt
" nmap <S-TAB> gT

" -------------
"  editor's command
" -------------
imap jk <ESC>l

nmap j gj
nmap k gk
" file save
nmap <Leader>fs :w<cr>
nmap <Leader>ev :tabe $MYVIMRC<cr>
nmap <Leader>em :tabe ~/.vim/vimrc.d/mapping.vim<cr>
nmap <Leader>sv :so $MYVIMRC<cr>
nmap <Leader>sm :so ~/.vim/vimrc.d/mapping.vim<cr>

nnoremap <silent> <Leader>/ :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" Change PWD to current where file locates.
nmap <leader>cd :cd %:p:h<cr>


" -------------
" NERDTree shortcuts
" -------------
nmap <Leader>nt <plug>NERDTreeTabsToggle<CR>
nmap <Leader>nmt <plug>NERDTreeMirrorToggle<CR>
nmap <Leader>nfr :NERDTreeFind<cr>

"""""""""
"  FZF  "
"""""""""
nmap <Leader>pf :Files<CR>
nmap <Leader>pg :GitFiles<CR>
nmap <Leader>bb :Buffers<CR>
nmap <Leader>pb :Buffers<CR>
nmap <Leader>pw :Windows<CR>
nmap <Leader>pc :BCommits<CR>
nmap <Leader>ph :History
nmap <Leader>pt :BTags<CR>


""""""""""""""""
"  Easy Align  "
""""""""""""""""
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" -------------
" VimFiler
" -------------
" nmap <Leader>nft :VimFilerTab<cr>
" nmap <Leader>nfo :VimFiler<cr>
" nmap <Leader>nfb :VimFilerExplorer<cr>
" nmap <Leader>nfs :VimFilerSplit<cr>
" nmap <Leader>nfr :VimFilerExplorer -find<cr>

" Double click edit file
autocmd FileType vimfiler nmap <buffer><silent> <2-LeftMouse> :call <SID>vimfiler_on_double_click()<CR>
function! s:vimfiler_on_double_click() "{{{
    let context = vimfiler#get_context()

    if context.explorer
        let mapping = vimfiler#mappings#smart_cursor_map(
                    \ "\<Plug>(vimfiler_expand_tree)",
                    \ "\<Plug>(vimfiler_edit_file)"
                    \ )
    else
        let mapping = vimfiler#mappings#smart_cursor_map(
                    \ "\<Plug>(vimfiler_cd_file)",
                    \ "\<Plug>(vimfiler_edit_file)"
                    \ )
    endif

    execute "normal " . mapping
endfunction"}}}

" -------------
" NeoBundle
" -------------
" nmap <Leader>bi :NeoBundleInstall<cr>
" nmap <Leader>bu :NeoBundleInstall!<cr>

" -------------
" Fugitive
" -------------
nmap <Leader>gs :Gstatus<cr>

" -------------
" EasyTags
" -------------
" nmap <Leader>tu :UpdateTags<cr>
" nmap <Leader>th :HighlightTags<cr>

" -------------
" Toggle relative numbers
" -------------
nmap <Leader>nr :NumbersToggle<cr>

""""""""""""
"  Golang  "
""""""""""""
augroup gomap
    au FileType go nmap <buffer> <Leader>xx <Plug>(go-run)
    au FileType go nmap <buffer> <Leader>gt <Plug>(go-test)
    au FileType go nmap <buffer> <Leader>dt <Plug>(go-def-tab)
    au FileType go nmap <buffer> <Leader>ds <Plug>(go-def-split)
    au FileType go nmap <buffer> <Leader>dv <Plug>(go-def-vertical)
    au FileType go nmap <buffer> <Leader>jd <Plug>(go-def)
    au FileType go nmap <buffer> <Leader>gd <Plug>(go-doc)
    au FileType go nmap <buffer> <Leader>gi <Plug>(go-implements)
    au FileType go nmap <buffer> <Leader>gr <Plug>(go-rename)
augroup END

"""""""""
"  CPP  "
"""""""""
augroup cpp
    au FileType c,cpp nnoremap <Leader>jd :YcmCompleter GoTo<CR>
augroup END


""""""""""
"  Dash  "
""""""""""
nmap <silent> <Leader>dd <Plug>DashSearch

""""""""""""""
"  Markdown  "
""""""""""""""
nmap <Leader>mp :LivedownToggle<CR>

" -------------
"  Unite
" -------------
" nmap <Leader>uc :Unite 
" nmap <Leader>uf :Unite -toggle -start-insert file_rec/async<cr>
" nmap <Leader>uqb :Unite -toggle -quick-match buffer<cr>
" nmap <Leader>uqt :Unite -toggle -quick-match tab<cr>
" nmap <Leader>ub :Unite -toggle buffer<cr>
" nmap <Leader>ut :Unite -toggle tab<cr>
" nmap <Leader>up :Unite -toggle process<cr>
" nmap <Leader>ur :Unite -toggle file_mru<cr>
" nmap <Leader>uy :Unite history/yank<cr>
" nmap <Leader>u/ :Unite grep:.<cr>

" " -------------
" "  NeoSnippet
" " -------------
" nmap <Leader>ser :NeoSnippetEdit -split -vertical -runtime<cr>
" nmap <Leader>seu :NeoSnippetEdit -split -vertical<cr>
"
" " -------------
" " NeoComplete
" " -------------
" if !has('nvim')
"     inoremap <expr><C-g>    neocomplete#undo_completion()
"     inoremap <expr><C-l>    neocomplete#complete_common_string()
"     inoremap <expr><C-SPACE> neocomplete#start_manual_complete()
"     inoremap <expr><C-@> neocomplete#start_manual_complete()
"
"     " Recommended key-mappings.
"     " <CR>: close popup and save indent.
"     " imap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"     " imap <expr> <CR> pumvisible()
"     "             \ ? :neocomplete#close_popup()
"     "             \ : "<Plug>delimitMateCR"
"     " function! s:my_cr_function()
"     " return neocomplete#close_popup() . "\<CR>"
"     " For no inserting <CR> key.
"     " if g:delimitMate_expand_cr != 0
"     "     return pumvisible() ? neocomplete#close_popup() : <Plug>delimitMateCR
"     " else
"     " return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"     " endif
"     " endfunction
"     if g:delimitMate_expand_cr != 0
"         imap <expr> <CR> pumvisible()
"                     \ ? "\<C-Y>"
"                     \ : "<Plug>delimitMateCR"
"     else
"         imap <expr> <CR> pumvisible()
"                     \ ? ""
"                     \ : "\<CR>"
"     endif
" endif
" inoremap <silent><expr> <C-@>
"             \ deoplete#mappings#manual_complete()

if (exists('g:deoplete_loaded') && g:deoplete_loaded)
    inoremap <silent><expr> <C-space> deoplete#mappings#manual_complete()
    inoremap <expr><C-g> deoplete#undo_completion()
    inoremap <expr><C-l> deoplete#refresh()
    imap <expr><TAB>    pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<S-Tab>"
endif

" -------------
" NeoSnippet
" -------------
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" -------------
" UltiSnips
" -------------
let g:UltiSnipsExpandTrigger='<c-k>'
let g:UltiSnipsListSnippets='<c-l>'
let g:UltiSnipsJumpForwardTrigger='<c-k>'
let g:UltiSnipsJumpBackwardTrigger='<c-j>'

" -------------
" Tagbar
" -------------
nmap <Leader>tt :TagbarToggle<cr>

" -------------
" YouCompleteMe
" -------------
" nnoremap <Leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

""" FileType specific mappings --------

" PHP XDEBUG{{{
" -------------
" augroup php_mapping
"     au FileType php nmap <leader>pd :python debugger_run()<cr>
"     au FileType php nmap <leader>ps :python debugger_quit()<cr>
"     au FileType php nmap <leader>pe :python debugger_watch_input("eval")<cr>A
" augroup END}}}

" Run specs{{{
" -------------
" augroup ruby_mapping
"     au FileType ruby,eruby nmap <Leader>rc :call RunCurrentSpecFile()<cr>
"     au FileType ruby,eruby nmap <Leader>rn :call RunNearestSpec()<cr>
"     au FileType ruby,eruby nmap <Leader>rl :call RunLastSpec()<cr>
"     au FileType ruby,eruby nmap <Leader>ra :call RunAllSpecs()<cr>
" augroup END"}}}

" FileType specific map {{{"
" au FileType php nmap <leader>jd :PhpSearchContext -a tabedit <c-r>=expand("<cword>")<cr><cr>
au FileType php nmap <leader>jd :PhpSearchContext <c-r>=expand("<cword>") . " -a tabedit -s project"<cr><cr>
au FileType php nmap <leader>js :PhpSearch -p <c-r>=expand("<cword>") . " -a tabedit -t "<cr>
" }}} "


"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  c-a and c-e key binding in insert mode like emacs  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <c-a> <Home>
cmap <c-a> <Home>
imap <c-e> <End>
cmap <c-e> <End>

""""""""""""""""""""""""
"  Disable arrow keys  "
""""""""""""""""""""""""
nmap <Left>  <c-w><c-h>
nmap <Right> <c-w><c-l>
nmap <Up>    <c-w><c-k>
nmap <Down>  <c-w><c-j>
nmap <M-Left> :tabprevious<cr>
nmap <M-Right> :tabnext<cr>
nmap <M-Up> :tabfirst<cr>
nmap <M-Down> :tablast<cr>

nmap <S-H> :tabprevious<cr>
nmap <S-L> :tabnext<cr>
nmap <Leader>w <c-w>
nmap <S-Left> :-tabm<cr>
nmap <S-Right> :+tabm<cr>
nmap <Leader>q :q<cr>

" -------------
" Undotree Here --------------
" -------------
nmap <leader>ut :UndotreeToggle<CR>

" -------------
" SingleCompile Here ----------
" -------------
nmap <leader>xc :SCCompile<cr>
nmap <leader>xx :SCCompileRun<cr>
" nmap <Leader>gc :call CompileCode()<CR>
" nmap <Leader>gr :call RunCode()<CR>
" nmap <Leader>cc :call CompileCodeClang()<CR>
" nmap <Leader>ct :call CompileCodeClangTest()<CR>
" nmap <Leader>cr :call RunCode()<CR>

" nmap <F10> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

""""""""""""""
"  Hex mode  "
""""""""""""""
nmap <Leader>hon :%!xxd<cr>
nmap <Leader>hof :%!xxd -r<cr>


" Terminal mappings"{{{
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    tmap jj <ESC>
endif
"}}}

""""""""""""
"  iTunes  "
""""""""""""
nmap <leader>ip :!itunes pause<cr>
nmap <leader>il :!itunes play<cr>

nmap <leader>jf :%!python -m json.tool<cr>

" command! StartPadawan call deoplete#sources#padawan#StartServer()
" command! StopPadawan call deoplete#sources#padawan#StopServer()
" command! RestartPadawan call deoplete#sources#padawan#RestartServer()

" Jump to the first placeholder by typing `<C-k>`.
" autocmd FileType swift imap <buffer> <C-k> <Plug>(autocomplete_swift_jump_to_placeholder)
