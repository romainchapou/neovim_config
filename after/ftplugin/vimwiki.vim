" Markdown/Vimwiki abbreviations
setlocal commentstring=\%\%\ %s
nnoremap <buffer> - :FzfLua tags<cr>

" This shouldn't be needed :/
setlocal iskeyword-=.

nnoremap <buffer> <m-h> [s
nnoremap <buffer> <m-l> ]s

nnoremap <buffer> <C-CR> <Plug>VimwikiToggleListItem
vnoremap <buffer> <C-CR> <Plug>VimwikiToggleListItem

nnoremap <buffer> o <Plug>VimwikiListo
nnoremap <buffer> O <Plug>VimwikiListO
