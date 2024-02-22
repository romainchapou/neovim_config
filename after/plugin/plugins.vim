" --- MundoTree --- "
nnoremap <leader>U :MundoToggle<cr>

" --- CamelCaseMotion --- "
omap v <Plug>CamelCaseMotion_iw

" --- vim-qf ---
let g:qf_auto_open_quickfix = 0
let g:qf_nowrap = 0

" --- TagBar --- "
nnoremap <F10> :TagbarToggle<cr>

" --- Goyo --- "
noremap <Leader>f :Goyo<CR>
noremap <Leader>F :Goyo 100<CR>
" autocmd! User GoyoLeave SignifyEnableAll

" : map (what was , before)
map , <Plug>SneakPrevious

" --- git-gutter --- "
let g:gitgutter_map_keys = 0
nnoremap H <Plug>(GitGutterPrevHunk)
nnoremap L <Plug>(GitGutterNextHunk)
nnoremap <leader>s :w\|GitGutterStageHunk<cr>
nnoremap <leader>u <Plug>(GitGutterUndoHunk)
xnoremap <leader>s :<,>GitGutterStageHunk<cr>
xnoremap <leader>u :<,>GitGutterUndoHunk<cr>
nnoremap <leader>gc :GitGutterQuickFix<cr>
nnoremap <leader>gt :GitGutterToggle<cr>

let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" Note: this is pretty nice, but no command to stage a hunk, so stay on git
" gutter for now.
" === signify ===
" let g:signify_sign_add               = '+'
" let g:signify_sign_delete            = '-'
" let g:signify_sign_delete_first_line = '‾'
" let g:signify_sign_change            = '~'
" let g:signify_sign_change_delete     = g:signify_sign_change . g:signify_sign_delete_first_line
" let g:signify_sign_show_count        = 0
" let g:signify_vcs_cmds               = { 'git': 'git diff --no-color --no-ext-diff -U0 -- %f' }
" let g:signify_vcs_cmds_diffmode      = { 'git': 'git show HEAD:./%f' }
" nnoremap <leader>u :SignifyHunkUndo<cr>
" nmap L <plug>(signify-next-hunk)
" nmap H <plug>(signify-prev-hunk)

" --- fugitive --- "
nnoremap <leader>gs :vert G<cr>
nnoremap <leader>gS :G<cr>
nnoremap g<space> :Git<space>

" --- fzf --- "
nnoremap - :FzfLua tags<cr>
nnoremap è :FzfLua files<cr>
nnoremap & :FzfLua buffers<cr>
nnoremap é :FzfLua oldfiles<cr>
nnoremap _ :FzfLua btags<cr>
nnoremap ² :FzfLua<cr>

" --- GoToHeader ---
let g:goto_header_associate_cpp_h = 1
nnoremap gh :GotoHeaderSwitch<CR>

" --- vimwiki --- "
let g:vimwiki_list = [{'path': '~/Documents/vimwiki/', 'syntax': 'markdown'}]
" Extend vimwiki syntax to all markdown files
let g:vimwiki_ext2syntax = {
      \ '.Rmd': 'markdown', '.rmd': 'markdown',
      \ '.md': 'markdown', '.markdown': 'markdown',
      \ '.mdown': 'markdown'}
nnoremap <Leader>wn <Plug>VimwikiNextLink

" --- pear-tree --- "
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1
" To disable pear-tree easely
nnoremap <leader>P :PearTreeDisable<cr>

" --- EasyAlign --- "
nmap gA <Plug>(EasyAlign)
xmap gA <Plug>(EasyAlign)

" --- Bclose --- "
let g:bclose_no_plugin_maps = 1
nnoremap Q :Bclose<cr>

" --- confiture ---
nnoremap <leader><tab> :e project.conf<cr>
nnoremap <leader>c :silent! wa<cr>:ConfitureDispatch configure<cr>
nnoremap <leader>b :silent! wa<cr>:Confiture build<cr>
nnoremap <leader><cr> :silent! wa<cr>:Confiture build_and_run<cr>

" --- gtest_confiture ---
nnoremap <leader>t :GtestConfitureSetTest<cr>
nnoremap <leader>T :GtestConfitureSetClass<cr>
