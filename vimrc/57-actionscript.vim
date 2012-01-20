au BufNewFile,BufRead *.mxml set filetype=mxml
au BufNewFile,BufRead *.as   set filetype=actionscript
au FileType mxml :call ConfigureForMxml()
au FileType actionscript :call ConfigureForMxml()
function! ConfigureForMxml()
  nnoremap <buffer> <Space>e  :<C-u>call ActionScriptBuild()<CR>
  set noexpandtab
  set tabstop=4
  set shiftwidth=4
  set grepprg=grep
  setlocal makeprg=mxmlc\ -compiler.locale=ja_JP\ %
  set grepprg=internal
  function! ActionScriptBuild()
    "set makeprg?
    make
  endfunction
endfunction
