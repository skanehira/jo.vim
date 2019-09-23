" jo.vim
" Author: skanehira
" License: MIT

if exists('g:loaded_jo')
  finish
endif
let g:loaded_jo = 1

let s:save_cpo = &cpo
set cpo&vim

if !hasmapto('<Plug>(jo-do)')
   inoremap <silent> <Plug>(jo-do) <C-o>:<C-u>call jo#do()<CR>
endif

if !hasmapto('<C-j>', 'i')
   imap <C-j> <Plug>(jo-do)
endif

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set et:
