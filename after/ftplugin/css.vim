iab <buffer> :: /* */<c-o>2h
setlocal textwidth=150
setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab autoindent

nnoremap <buffer> <leader>F :vimgrep // `fd -e css`<c-b><c-right><right><right>
nnoremap <buffer> <leader>gw :vimgrep // `fd -e css`<c-b><c-right><right><right>
nnoremap <buffer> <leader>gg *:vimgrep "<c-r><c-/>" `fd -e css`<CR>
