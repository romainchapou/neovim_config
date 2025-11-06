" autoindent pasting
nnoremap zp p`[V`]=
nnoremap zP P`[V`]=

nmap gcap gcip

" fix c-space doing <esc>.
inoremap <c-space> <space>

" no preview when completing, thanks
set completeopt-=preview

" shortcut for ']' text object
onoremap ir i]
onoremap ar a]
xnoremap ir i]
xnoremap ar a]

" search inside visual selection TODO test
vnoremap <S-M-/> <Esc>/\%V

" file explorer mappings
nnoremap <silent> <leader>e :e .<cr>
nnoremap <silent> <leader>E :e %:h<cr>
autocmd FileType fern nnoremap <buffer> <leader>c <Plug>(fern-action-cd:root)

" Remap to quickly use vimgrep
nnoremap <leader>F :vimgrep // **/*<s-left><left><left>
nnoremap <leader>gw :vimgrep // **/*<s-left><left><left>
nnoremap <leader>gg *:vimgrep "<c-r><c-/>" **/*<CR>
nnoremap <leader>w :wa<CR>

" change a word, and then, to change the next same word again,
" you can use the dot command
nnoremap cx *``cgn

" Paste the last yank easely
nnoremap gp "0p
nnoremap gP "0P
xnoremap gp "0p
xnoremap gP "0P

nnoremap <Leader>C :set cursorline!<cr>
nnoremap ù .
nnoremap à @q
nnoremap Y y$

nnoremap <leader>v <c-w>v
nnoremap <leader>o <c-w>o

nnoremap dgt :tabclose<cr>

" Easy expension of the active file directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" <++> type anchors
inoremap <Leader>ç <Esc>/\V<++><Esc>"_c4l
inoremap <Leader>_ <++>
nnoremap <Leader>ç <Esc>/\V<++><Esc>"_c4l
nnoremap <Leader>_ a<++><Esc>

nnoremap <leader>q :q<cr>

nnoremap <C-C> :ccl<CR>

nnoremap <C-BS> g;

inoremap <C-BS> <C-W>
tnoremap <C-BS> <C-W>

nnoremap <M-B> g;
nnoremap <M-N> g,

" :w!! to save with sudo
cabbrev w!! w !sudo tee >/dev/null "%"

" mapping to toggle spell
noremap <F7> :setlocal spell spelllang=en<CR>
noremap <F8> :setlocal spell spelllang=fr<CR>
noremap <F9> :setlocal nospell<CR>

function! ToggleTextWidth()
  let &textwidth = &textwidth ==# 0 ? 100 : 0
  echomsg 'textwidth now ' . &textwidth
endfunction

nnoremap <leader>& :call ToggleTextWidth()<cr>

nmap gs <c-w>o<c-w>vgd

nnoremap <C-à> ]M
nnoremap <C-ç> [m

" wow mouse support
nnoremap <X1Mouse> <c-o>
nnoremap <X2Mouse> <c-i>
nmap <MiddleMouse> <LeftMouse>gd
nmap <C-LeftMouse> <LeftMouse>gd
nmap <S-ScrollWheelUp> 6zl
nmap <S-ScrollWheelDown> 6zh
