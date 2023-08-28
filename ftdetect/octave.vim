augroup octave
  autocmd!
  autocmd BufRead,BufNewFile *.m,*.oct setfiletype octave
  " https://docs.octave.org/latest/The-DESCRIPTION-File.html
  autocmd BufNewFile,BufRead DESCRIPTION setfiletype yaml
  " TODO: https://github.com/gnu-octave/vim-octave/issues/5
  " https://docs.octave.org/latest/The-INDEX-File.html
  " autocmd BufNewFile,BufRead INDEX setfiletype octave-index
augroup END
