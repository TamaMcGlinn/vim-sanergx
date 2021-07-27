
" Open the url
function! sanergx#GXBrowse(url)
  let redir = '>&/dev/null'
  if exists('g:netrw_browsex_viewer')
   let viewer = g:netrw_browsex_viewer
  elseif has('unix') && executable('xdg-open')
   let viewer = 'xdg-open'
  elseif has('macunix') && executable('open')
   let viewer = 'open'
  elseif has('win64') || has('win32')
   let viewer = 'start'
   redir = '>null'
  else
   return
  endif

  execute 'silent! !' . viewer . ' ' . shellescape(a:url, 1) . redir
  redraw!
endfunction


" If it is a plug line, open the github for the plugin,
" otherwise just open the url
function! sanergx#OpenGithub() abort
  let l:line = getline('.')
  if l:line =~ "^Plug '"
    let url = substitute(substitute(l:line, "^Plug '", 'https://github.com/', ''), "'.*$", '', '')
    call sanergx#GXBrowse(l:url)
  else
    call sanergx#GXBrowse(expand('<cWORD>'))
  endif
endfunction

