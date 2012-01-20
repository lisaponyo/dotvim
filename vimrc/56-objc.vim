au FileType objc :call ConfigureForOBJC() "OBJC用の設定を読み込み
function! ConfigureForOBJC()
  nnoremap <buffer> <Space>e  :<C-u>call XcodeBuildCheck()<CR>
  set noexpandtab
  set tabstop=4
  set shiftwidth=4
  set grepprg=grep
  setlocal makeprg=xcodebuild\ -activetarget\ -activeconfiguration\ -sdk\ iphonesimulator4.1\\\|\ grep\ -e\ '^/.*'
  set grepprg=internal
  function! XcodeBuildCheck()
    set makeprg?
    let proj_dir = substitute(b:cocoa_proj, '(.*)/.*' , '1', '')
    let current_dir = getcwd()
    execute ":lcd " . escape(expand(proj_dir), ' #\')
    silent!make
    execute ":lcd " . escape(expand(current_dir), ' #\')
  endfunction
endfunction

