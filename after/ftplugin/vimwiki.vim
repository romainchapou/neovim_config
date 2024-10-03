" Markdown/Vimwiki abbreviations
setlocal commentstring=\%\%\ %s
nnoremap <buffer> - :FzfLua tags<cr>

" This shouldn't be needed :/
setlocal iskeyword-=.

nnoremap <buffer> <m-h> [s
nnoremap <buffer> <m-l> ]s

nmap <C-CR> <Plug>VimwikiToggleListItem
vmap <C-CR> <Plug>VimwikiToggleListItem
