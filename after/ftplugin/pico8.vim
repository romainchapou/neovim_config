" setlocal noexpandtab
" setlocal tabstop=4
setlocal shiftwidth=2
setlocal commentstring=--\ %s
" normal G?^__gfx__zfGgg
hi Error NONE
nnoremap <buffer> <leader>R :!ctags --language-force=lua *.{p8,lua}<CR><CR>
