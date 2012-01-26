"colorscheme solarized
set guifont=Ricty\ 12
"set mouse=a
"set nomousefocus " マウスの移動でフォーカスを自動的に切替えない (mousefocus:切替る)
set mousehide " 入力時にマウスポインタを隠す (nomousehide:隠さない)
set guioptions=a
if &guioptions =~# 'M'
  let &guioptions = substitute(&guioptions, '[mT]', '', 'g')
endif
