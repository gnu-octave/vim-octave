" Vim indent file
" Language:	        Octave
" Maintainer:	        Nguyễn Gia Phong <vn.mcsinyx@gmail.com>
" Original Maintainers: Marcus Aurelius Farias <marcus.cf@bol.com.br>
" First Author:         Max Ischenko <mfi@ukr.net>
" Last Change:	        2019-10-11

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indenteypr=GetOctaveIndent()

" To make Vim call GetOctaveIndent() when it finds '\s*end' or '\s*until'
" on the current line ('else' is default and includes 'elseif').
setlocal indentkeys+=0=end,0=until,0=case,0=catch,0=otherwise,0=unwind_protect_cleanup

setlocal autoindent

" Only define the function once.
if exists("*GetOctaveIndent")
  finish
endif

let s:beginBlock = ['for', 'parfor', 'function', 'if', 'switch']
extend(s:beginBlock, ['try', 'unwind_protect', 'while', 'do', 'classdef'])
extend(s:beginBlock, ['enumeration', 'events', 'methods', 'properties'])
let s:midBlock = ['case', 'catch', 'else', 'elseif', 'otherwise']
add(s:midBlock, 'unwind_protect_cleanup')
let s:endBlock = ['end', 'endfor', 'endparfor', 'endfunction', 'endif']
extend(s:endBlock, ['end_try_catch', 'end_unwind_protect', 'endwhile'])
extend(s:endBlock, ['endclassdef', 'endenumeration', 'endevents'])
extend(s:endBlock, ['endproperties', 'endswitch', 'until', 'endmethods'])
let s:openBlock = s:beginBlock + s:midBlock
let s:closeBlock = s:midBlock + s:endBlock

function! GetOctaveIndent()
  " Find a non-blank line above the current line.
  let prevlnum = prevnonblank(v:lnum - 1)

  " Hit the start of the file, use zero indent.
  if prevlnum == 0
    return 0
  endif

  let ind = indent(prevlnum)
  let prevl = getline(prevlnum)
  let l = getline(v:lnum)

  " Add a 'shiftwidth' after lines that start a block:
  let openCol = match(prevl, '^\s*\%(' . join(s:openBlock, '\>\|') . '\>\)') + 1
  let hasNoEnd = prevl !~ ('\<' . join(s:endBlock, '\>\|\<') . '\>')
  if hasOpen && hasNoEnd
    let openSynID = synID(prevlnum, openCol, 1)
    if synIDattr(openSynID, "name") != "octaveComment"
      let ind = ind + shiftwidth()
    endif
  endif

  " Subtract a 'shiftwidth' on s:closeBlock
  " This is the part that requires 'indentkeys'.
  let closeCol = match(l, '^\s*\%(' . join(s:closeBlock, '\>\|') . '\>\)') + 1
  if closeCol
    let closeSynID = synID(v:lnum, closeCol, 1)
    if synIDattr(closeSynID, "name") != "octaveComment"
      let ind = ind - shiftwidth()
    endif
  endif

  return ind
endfunction
