" jo.vim
" Author: skanehira
" License: MIT

let s:save_cpo = &cpo
set cpo&vim

function! s:parse_value(v) abort
	if a:v =~# '\d\+'
		if (a:v[0] is# '"' && a:v[-1:-1] is# '"') || (a:v[0] is# "'" && a:v[-1:-1] is# "'")
			return a:v[1:-2]
		else
			if stridx(a:v, '.') != -1
				return str2float(a:v)
			else
				return str2nr(a:v)
			endif
		endif
	else
		return a:v
	endif
endfunction

function! jo#do() abort
	let line = getline('.')
	let elm = split(line, ' ')
	let obj = {}
	for e in elm
		let [k, v] = split(e, '=')
		let obj[k] = s:parse_value(v)
	endfor

	" to save undo
	<C-o>i

	call setline(getcurpos()[1],json_encode(obj))
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
