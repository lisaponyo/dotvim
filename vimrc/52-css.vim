au FileType css :call ConfigureForCSS() "CSS用の設定を読み込み
function! ConfigureForCSS()
  set tabstop=2 "タブ幅
  set shiftwidth=2 "インデント幅
  inoremap <expr> : smartchr#one_of(': ', ':')
  "inoremap { {}<LEFT><CR><CR><UP><TAB><End>
  inoremap { {}<LEFT>
  inoremap ' ''<Left>
  inoremap " ""<Left>
  inoremap [ []<LEFT>
  inoremap ( ()<LEFT>
endfunction
