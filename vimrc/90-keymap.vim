"""""""""map""""""""
"""""""""inoremap""""""""
"inoremap <C-s> <ESC>:<C-u>write<CR>
inoremap <C-f> <Right>
inoremap <C-b> <LEFT>
inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Del>
inoremap jk <ESC>
inoremap <C-g> <ESC>
inoremap <C-h> <BS>
"""""""""vnoremap""""""""
"vnoremap : ;
"vnoremap ; :
vnoremap <C-g> <ESC>
"""""""""cnoremap""""""""
cnoremap jk <ESC>
cnoremap <C-f> <Right>
cnoremap <C-b> <LEFT>
cnoremap <C-a> <Home>
"""""""""nnoremap""""""""
nnoremap qq :<C-u>close<CR>
nnoremap j gj
nnoremap k gk
"nnoremap : ;
"nnoremap ; :
nnoremap <C-s> :<C-u>w<CR>
nnoremap <C-z> <Nop>
nnoremap <C-j> <C-w>j
nnoremap <C-h> :<C-u>tabprevious<CR>
nnoremap <C-k> <C-w>k
nnoremap <C-l> :<C-u>tabnext<CR>
"""""""""todo""""""""
nnoremap    [todo]   <Nop>
nmap    <Space> [todo]
nnoremap [todo]f  :<C-u>VimFiler<CR>
"nnoremap [todo]m  :<C-u>marks<CR>
"nnoremap [todo]n  :<C-u>Navi<CR>
"nnoremap [todo]s  :<C-u>DBExecSQL<SPACE>
"nnoremap [todo]r  :<C-u>source $MYVIMRC<CR>
"nnoremap [todo]e  :<C-u>call<SPACE>Regex()<CR>
nnoremap [todo]tc :<C-u>tabnew<CR>
nnoremap [todo]cd :<C-u>lcd %:p:h<CR>
"""""""""neocomplcache""""""""
" Plugin key-mappings.
imap     <C-l>       <Plug>(neocomplcache_snippets_expand)
smap     <C-l>       <Plug>(neocomplcache_snippets_expand)
" SuperTab like snippets behavior.
" imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  neocomplcache#smart_close_popup()."\<C-h>"
nnoremap <Leader>ss  :<C-u>NeoComplCacheEditSnippets<CR>
"""""""""unite""""""""
nnoremap    [unite]   <Nop>
nmap    <Space>u [unite]
nnoremap <silent> [unite]u  :<C-u>Unite -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]f  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]m  :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]r  :<C-u>Unite register<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.
  imap <buffer> jj      <Plug>(unite_insert_leave)
  imap <buffer> jk      <Plug>(unite_insert_leave)
  nnoremap <buffer> t G
  nnoremap <silent><buffer> <C-k> :<C-u>call unite#mappings#do_action('preview')<CR>
  "let g:unite_enable_start_insert = 1
endfunction"}}}
