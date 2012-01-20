au FileType vim :call ConfigureForVim() "Vim用の設定を読み込み
function! ConfigureForVim()
  inoremap ' ''<Left>
  inoremap [ []<LEFT>
  inoremap ( ()<LEFT>
endfunction
