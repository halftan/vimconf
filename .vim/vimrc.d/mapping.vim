let mapleader = '\'

" Template
" nmap <Leader>

"  editor's command
imap jj <ESC>l
nmap <Leader>s :w<cr>
nmap <Leader>ev :sp $MYVIMRC<cr>
nmap <Leader>sv :so ~/.vimrc<cr>

nmap <Leader>/ :nohlsearch<cr>


" NERDTree shortcuts
nmap <Leader>t :NERDTreeToggle<CR>

" Vundle
nmap <Leader>bi :BundleInstall<cr>
nmap <Leader>bu :BundleInstall!<cr>

nmap <Leader>gst :Gstatus<cr>

" Toggle relative numbers
nmap <Leader>nr :NumbersToggle<cr>

" Run specs
nmap <Leader>rc :call RunCurrentSpecFile()<cr>
nmap <Leader>rn :call RunNearestSpec()<cr>
nmap <Leader>rl :call RunLastSpec()<cr>
nmap <Leader>ra :call RunAllSpecs()<cr>



""""""""""""""""""""""""
"  Disable arrow keys  "
""""""""""""""""""""""""
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

