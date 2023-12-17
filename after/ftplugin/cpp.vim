nnoremap <buffer> <leader>gw :vimgrep // `fd -e cpp -e h`<c-b><c-right><right><right>
nnoremap <buffer> <leader>gg *:vimgrep "<c-r><c-/>" `fd -e cpp -e h`<CR>

" useful abbreviations
iab <buffer> :: /* */<c-o>2h
iab <buffer> ;; std::cout << << std::endl;<c-o>13h
