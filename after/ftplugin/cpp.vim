nnoremap <buffer> <leader>gw :vimgrep // **/*.{cpp,h}<s-left><left><left>
nnoremap <buffer> <leader>gg *:vimgrep "<c-r><c-/>" **/*.{cpp,h}<CR>

" useful abbreviations
iab <buffer> :: /* */<left><left><left>
iab <buffer> ;; std::cout << << std::endl;<c-o>13h
