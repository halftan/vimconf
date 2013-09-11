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
nmap <Leader>cc :call CompileCode()<CR>
" imap <m-c> <ESC>:call CompileCode()<CR>
" vmap <m-c> <ESC>:call CompileCode()<CR>

" Alt + R 一键保存、运行
nmap <Leader>cr :call RunCode()<CR>
" imap <m-x> <ESC>:call RunCode()<CR>
" vmap <m-x> <ESC>:call RunCode()<CR>
