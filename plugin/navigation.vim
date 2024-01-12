nnoremap gg gg0

nnoremap gH H
nnoremap gL L


" --- terminal configuration ---

tnoremap <C-space> <C-\><C-n>

function! NeovimTermOpen()
  :split
  :terminal
endfunction

function! VertNeovimTermOpen()
  :vsplit
  :terminal
endfunction

nnoremap <c-t> :call VertNeovimTermOpen()<cr>
nnoremap T :call NeovimTermOpen()<cr>

cabbrev ter call NeovimTermOpen()

set mouse=a

nnoremap <C-ScrollWheelDown> <C-O>
nnoremap <C-ScrollWheelUp> <C-I>

" resise window shortcuts
noremap <c-s-right> <C-W>>
noremap <c-s-left>  <C-W><
noremap <c-s-up>    <C-W>+
noremap <c-s-down>  <C-W>-

cnoremap <C-P> <up>
cnoremap <C-N> <down>


" Move the cursor easily in insert mode
inoremap <c-h> <left>
inoremap <c-l> <right>

" Easier access to scrolling
nnoremap K <c-e>
nnoremap J <c-y>
xnoremap K <c-e>
xnoremap J <c-y>

nmap z<cr> zt

" Access to default J and K
noremap gj J
noremap gk K

" Move by screen lines
noremap j gj
noremap k gk

" TODO fix this outputing `" in the terminal windows when switching to it
noremap <tab> <c-^>`"
" remap default <c-i> behaviour as it is also <tab>, which we want to use in a different way
noremap <C-P> <C-I>
noremap <m-s-l> :cn<cr>
noremap <m-s-h> :cp<cr>
noremap <leader>n :bn<cr>
noremap <leader>p :bp<cr>

" Spelling mistake navigation
nnoremap z) ]s
nnoremap z( [s

" tags go to definition shortcuts
nnoremap <leader>d <C-]>
nnoremap <leader>D g<C-]>

" Maps for easier diffput / diffget
xnoremap <leader>d :diffput<cr>
xnoremap <leader>D :diffget<cr>

" tab to continue search instead of ctrl-t ctrl-g
set wildcharm=<C-z>
cnoremap <expr> <Tab>   getcmdtype() =~ '[/?]' ? "<C-g>" : "<C-z>"
cnoremap <expr> <S-Tab> getcmdtype() =~ '[/?]' ? "<C-t>" : "<S-Tab>"
cnoremap <expr> <C-@>   getcmdtype() =~ '[/?]' ? "<C-t>" : "<S-Tab>"

" make n/N always search forward/backward
nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]
xnoremap <expr> n 'Nn'[v:searchforward]
xnoremap <expr> N 'nN'[v:searchforward]
