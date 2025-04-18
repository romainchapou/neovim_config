" TODO See
" https://stackoverflow.com/questions/11666170/persistent-set-syntax-for-a-given-filetype
" and in particular, the answer mentionning ftdetect

autocmd BufEnter *.pro,*.pri setlocal syntax=config
autocmd BufEnter *.pro,*.pri setlocal commentstring=#\ %s

autocmd BufEnter project.conf nmap <buffer> <CR> gcap

autocmd BufEnter CMakeLists.txt nnoremap <buffer> gh :e %:h/CMakeDependencies.cmake<cr>
autocmd BufEnter CMakeDependencies.cmake nnoremap <buffer> gh :e %:h/CMakeLists.txt<cr>

autocmd BufEnter *.vert nnoremap <buffer> gh :e %:r.frag<cr>
autocmd BufEnter *.frag nnoremap <buffer> gh :e %:r.vert<cr>

hi link markdownError Normal

" ANTLR files
autocmd BufEnter *.g4 setlocal syntax=antlr

autocmd BufEnter *.alda nnoremap <buffer> <cr> :w \| w !alda play & disown<cr><cr>:redraw!<cr>:redraw!<cr>
autocmd BufEnter *.alda setlocal commentstring=#\ %s
