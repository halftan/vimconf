if exists("b:current_syntax")
  finish
endif

if !exists("g:main_syntax")
  let g:main_syntax = 'gotmpl'
endif

runtime! syntax/yaml.vim
runtime! syntax/gotexttmpl.vim

if exists("b:current_syntax")
  unlet b:current_syntax
endif
let b:current_syntax = "gotmpl"

" vim: sw=2 ts=2 et
