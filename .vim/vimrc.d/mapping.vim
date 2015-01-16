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
imap jj <ESC>l
nmap <Leader>w :w<cr>
nmap <Leader>ev :tabe $MYVIMRC<cr>
nmap <Leader>em :tabe ~/.vim/vimrc.d/mapping.vim<cr>
nmap <Leader>sv :so $MYVIMRC<cr>
nmap <Leader>sm :so ~/.vim/vimrc.d/mapping.vim<cr>

nmap <Leader>/ :nohlsearch<cr>

" Change PWD to current where file locates.
nmap <leader>cd :cd %:p:h<cr>


" -------------
" NERDTree shortcuts
" -------------
" nmap <Leader>nt :NERDTreeToggle<CR>
" nmap <Leader>nt <plug>NERDTreeTabsToggle<CR>

" -------------
" VimFiler
" -------------
nmap <Leader>nft :VimFilerTab<cr>
nmap <Leader>nfo :VimFiler<cr>
nmap <Leader>nfb :VimFilerExplorer<cr>
nmap <Leader>nfs :VimFilerSplit<cr>

" -------------
" NeoBundle
" -------------
nmap <Leader>bi :NeoBundleInstall<cr>
nmap <Leader>bu :NeoBundleInstall!<cr>

" -------------
" Fugitive
" -------------
nmap <Leader>gs :Gstatus<cr>

" -------------
" EasyTags
" -------------
nmap <Leader>tu :UpdateTags<cr>
nmap <Leader>th :HighlightTags<cr>

" -------------
" Toggle relative numbers
" -------------
nmap <Leader>nr :NumbersToggle<cr>

" -------------
"  Unite
" -------------
nmap <Leader>uc :Unite 
nmap <Leader>uf :Unite file<cr>
nmap <Leader>ub :Unite buffer<cr>
nmap <Leader>ur :Unite file_rec<cr>
nmap <Leader>uy :Unite history/yank<cr>
nmap <Leader>u/ :Unite grep:.<cr>

" -------------
"  NeoSnippet
" -------------
nmap <Leader>ser :NeoSnippetEdit -split -vertical -runtime<cr>
nmap <Leader>seu :NeoSnippetEdit -split -vertical<cr>

" -------------
" NeoComplete
" -------------
inoremap <expr><C-g>    neocomplete#undo_completion()
inoremap <expr><C-l>    neocomplete#complete_common_string()
inoremap <expr><C-SPACE> neocomplete#start_manual_complete()
"
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
inoremap <expr><TAB>    pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<S-Tab>"


" -------------
" NeoSnippet
" -------------
imap <C-K>      <Plug>(neosnippet_expand_or_jump)
smap <C-K>      <Plug>(neosnippet_expand_or_jump)
xmap <C-K>      <Plug>(neosnippet_expand_target)


" -------------
" Tagbar
" -------------
nmap <Leader>tt :TagbarToggle<cr>

" -------------
" YouCompleteMe
" -------------
" nnoremap <Leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

""" FileType specific mappings --------

" -------------
" PHP XDEBUG
" -------------
" augroup php_mapping
"     au FileType php nmap <leader>pd :python debugger_run()<cr>
"     au FileType php nmap <leader>ps :python debugger_quit()<cr>
"     au FileType php nmap <leader>pe :python debugger_watch_input("eval")<cr>A
" augroup END

" -------------
" Run specs
" -------------
" augroup ruby_mapping
"     au FileType ruby,eruby nmap <Leader>rc :call RunCurrentSpecFile()<cr>
"     au FileType ruby,eruby nmap <Leader>rn :call RunNearestSpec()<cr>
"     au FileType ruby,eruby nmap <Leader>rl :call RunLastSpec()<cr>
"     au FileType ruby,eruby nmap <Leader>ra :call RunAllSpecs()<cr>
" augroup END


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


" -------------
" Undotree Here --------------
" -------------
nmap <leader>ut :UndotreeToggle<CR>

" -------------
" SingleCompile Here ----------
" -------------
nmap <leader>cc :SCCompile<cr>
nmap <leader>cr :SCCompileRun<cr>
" nmap <Leader>gc :call CompileCode()<CR>
" nmap <Leader>gr :call RunCode()<CR>
" nmap <Leader>cc :call CompileCodeClang()<CR>
" nmap <Leader>ct :call CompileCodeClangTest()<CR>
" nmap <Leader>cr :call RunCode()<CR>

nmap <F10> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

""""""""""""""
"  Hex mode  "
""""""""""""""
nmap <Leader>hon :%!xxd<cr>
nmap <Leader>hof :%!xxd -r<cr>
