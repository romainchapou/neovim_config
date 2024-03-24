setlocal shiftwidth=2

nnoremap <buffer> <leader>F :vimgrep // **/*.{lua,vim}<s-left><left><left>
nnoremap <buffer> <leader>gg *:vimgrep "<c-r><c-/>" **/*.{lua,vim}<CR>
nnoremap <buffer> <leader>D *:vimgrep "<c-r><c-w> =" **/*.{lua,vim}<CR>
