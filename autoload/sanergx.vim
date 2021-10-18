
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

  let l:url = substitute(a:url, '.*](', '', '')
  let l:url = substitute(l:url, ')$', '', '')

  execute 'silent! !' . viewer . ' ' . shellescape(l:url, 1) . redir
  redraw!
endfunction


" If it is a plug line, open the github for the plugin,
" otherwise just open the url
function! sanergx#OpenGithub() abort
  let l:line = getline('.')
  " Plug lines that contain one slash and don't start with slash or ~
  " are github URIs
  if l:line =~ "^Plug '[^/~][^/~]*/[^/]*'"
    let l:url = substitute(substitute(l:line, "^Plug '", 'https://github.com/', ''), "'.*$", '', '')
    call sanergx#GXBrowse(l:url)
  " Other plug lines are assumed to be directories
  elseif l:line =~ "^Plug '"
    let l:directory = substitute(substitute(l:line, "^Plug '", '', ''), "'.*$", '', '')
    execute 'e '.l:directory
  else
    call sanergx#GXBrowse(expand('<cWORD>'))
  endif
endfunction

