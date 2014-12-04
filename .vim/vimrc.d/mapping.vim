let mapleader = "\<space>"

" Template
" nmap <Leader>

" Write with sudo
cmap w!! w !sudo tee > /dev/null %

" map control-tab to swap between tabs
" nmap <C-TAB> gt
" nmap <S-TAB> gT

"  editor's command
imap jj <ESC>l
nmap <Leader>w :w<cr>
nmap <Leader>ev :tabe $MYVIMRC<cr>
nmap <Leader>sv :so $MYVIMRC<cr>

nmap <Leader>/ :nohlsearch<cr>

" Change PWD to current where file locates.
nmap <leader>cd :cd %:p:h<cr>


" NERDTree shortcuts
" nmap <Leader>nt :NERDTreeToggle<CR>
nmap <Leader>nt <plug>NERDTreeTabsToggle<CR>

" VimFiler
nmap <Leader>nf :VimFilerSplit<cr>

" Vundle
nmap <Leader>bi :NeoBundleInstall<cr>
nmap <Leader>bu :NeoBundleInstall!<cr>

nmap <Leader>gs :Gstatus<cr>

" Toggle relative numbers
nmap <Leader>nr :NumbersToggle<cr>

" Run specs
nmap <Leader>rc :call RunCurrentSpecFile()<cr>
nmap <Leader>rn :call RunNearestSpec()<cr>
nmap <Leader>rl :call RunLastSpec()<cr>
nmap <Leader>ra :call RunAllSpecs()<cr>

"  Unite
nmap <Leader>uf :Unite file<cr>
nmap <Leader>ub :Unite buffer<cr>
nmap <Leader>ur :Unite file_rec<cr>
let g:unite_source_history_yank_enable = 1
nmap <Leader>uy :Unite history/yank<cr>
nmap <Leader>u/ :Unite grep:.<cr>

" Tagbar
nmap <Leader>tt :TagbarToggle<cr>

" YouCompleteMe
nnoremap <Leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" PHP XDEBUG
nmap <leader>pd :python debugger_run()<cr>
nmap <leader>ps :python debugger_quit()<cr>
nmap <leader>pe :python debugger_watch_input("eval")<cr>A


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


" Undotree Here --------------
nmap <leader>ut :UndotreeToggle<CR>

" SingleCompile Here ----------
nmap <leader>cc :SCCompile<cr>
nmap <leader>cr :SCCompileRun<cr>
" nmap <Leader>gc :call CompileCode()<CR>
" nmap <Leader>gr :call RunCode()<CR>
" nmap <Leader>cc :call CompileCodeClang()<CR>
" nmap <Leader>ct :call CompileCodeClangTest()<CR>
" nmap <Leader>cr :call RunCode()<CR>

""""""""""""""
"  Hex mode  "
""""""""""""""
nmap <Leader>hon :%!xxd<cr>
nmap <Leader>hof :%!xxd -r<cr>
