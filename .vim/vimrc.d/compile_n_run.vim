" ======= 编译 && 运行 ======= "

" 编译源文件
func! CompileCode()
    exec "w"
    if &filetype == "c"
        exec "!gcc -Wall -g %<.c -o %< -D DEBUG -lm"
    elseif &filetype == "cpp"
        exec "!g++ -Wall -g %<.cpp -o %< -std=c++11 -D DEBUG -D CPP11 -lm"
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

func! CompileCodeClang()
    exec "w"
    if &filetype == "c"
        exec "!clang -Wall -g %<.c -o %< -D DEBUG -std=gnu99 -lm"
    elseif &filetype == "cpp"
        exec "!clang++ -Wall -g %<.cpp -o %< -std=c++0x -D DEBUG -D CPP0X -lm"
    else
        call CompileCode()
    endif
endfunc

func! CompileCodeClangTest()
    exec "w"
    if &filetype == "c"
        exec "!clang -Wall -g %<.c -o %< -D DEBUG -D TEST -std=gnu99 -lcheck -lm"
    elseif &filetype == "cpp"
        exec "!clang++ -Wall -g %<.cpp -o %< -std=c++0x -D DEBUG -D TEST -D CPP0X -lcheck -lm"
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

