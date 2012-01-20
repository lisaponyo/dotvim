au FileType javascript  :call ConfigureForJavaScript() "Javascript用の設定を読み込み
function! ConfigureForJavaScript()
  set tabstop=2 "タブ幅
  set shiftwidth=2 "インデント幅
  inoremap <expr> : smartchr#one_of(': ', ':')
  nnoremap <Space>d  :<C-u>Ref<SPACE>jquery<SPACE>
  "inoremap { {}<LEFT><CR><CR><UP><TAB><End>
  inoremap { {}<LEFT>
  inoremap ' ''<Left>
  inoremap " ""<Left>
  inoremap [ []<LEFT>
  inoremap ( ()<LEFT>
endfunction

