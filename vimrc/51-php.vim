au BufNewFile,BufRead *.thtml setfiletype php "thtmlをphpファイルとして認識
au BufNewFile,BufRead *.ctp setfiletype php "ctpをphpファイルとして認識
au BufNewFile,BufRead *.ctp execute ':CodingStyle short'
au BufNewFile,BufRead *.ctp execute ':set autoindent'
au BufNewFile,BufRead *.tpl setfiletype php "ctpをphpファイルとして認識
au FileType php :call ConfigureForPHP() "PHP用の設定を読み込み
function! ConfigureForPHP()
  set tabstop=4 "タブ幅
  set shiftwidth=4 "インデント幅
  inoremap <expr> - smartchr#loop('-', '->')
  "inoremap <expr> = smartchr#loop(' = ', ' == ', ' === ')
  "inoremap <expr> < smartchr#loop(' < ', ' <= ', '<')
  "inoremap <expr> > smartchr#loop(' > ', ' >= ', '>')
  "inoremap <expr> ! smartchr#loop('!', '!=')
  "inoremap { {}<LEFT><CR><CR><UP><TAB><End>
  inoremap { {}<LEFT>
  inoremap ' ''<Left>
  inoremap " ""<Left>
  inoremap [ []<LEFT>
  inoremap ( ()<LEFT>
endfunction
