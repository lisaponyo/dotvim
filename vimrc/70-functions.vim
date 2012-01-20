"ジャンクファイルの作成
command! -nargs=0 JunkFile call s:open_junk_file()
function! s:open_junk_file()
  let l:junk_dir = $HOME . '/.vim/junk'. strftime('/%Y%m')
  if !isdirectory(l:junk_dir)
    call mkdir(l:junk_dir, 'p')
  endif

  let l:filename = input('Junk Code: ', l:junk_dir.strftime('/%Y-%m-%d-%H%M%S.'))
  if l:filename != ''
    execute 'edit ' . l:filename
  endif
endfunction
"コーディングスタイルの変更
command!
    \   -bar -nargs=1 -complete=customlist,s:coding_style_complete
    \   CodingStyle
    \   execute get(s:coding_styles, <f-args>, '')
let s:coding_styles = {}
let s:coding_styles['short'] = 'set expandtab   tabstop=2 shiftwidth=2 softtabstop=2'
let s:coding_styles['long']  = 'set expandtab   tabstop=4 shiftwidth=4 softtabstop=4'
let s:coding_styles['gnu']   = 'set expandtab   tabstop=8 shiftwidth=2 softtabstop=2'
let s:coding_styles['bsd']   = 'set noexpandtab tabstop=8 shiftwidth=4 softtabstop&'
let s:coding_styles['linux'] = 'set noexpandtab tabstop=8 shiftwidth=8 softtabstop&'
function! s:coding_style_complete(...)
  return keys(s:coding_styles)
endfunction
" vimrcの再読込
augroup MyAutoCmd
  autocmd!
augroup END
if !has('gui_running') && !(has('win32') || has('win64'))
  autocmd MyAutoCmd BufWritePost *.vim nested source $MYVIMRC
else
  autocmd MyAutoCmd BufWritePost *.vim source $MYVIMRC | 
      \if has('gui_running') | source $MYGVIMRC
  autocmd MyAutoCmd BufWritePost *.vim if has('gui_running') | source $MYGVIMRC
endif
"TODO 戦闘力計測
command! -bar -bang -nargs=? -complete=file Scouter
\        echo Scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)
command! -bar -bang -nargs=? -complete=file GScouter
\        echo Scouter(empty(<q-args>) ? $MYGVIMRC : expand(<q-args>), <bang>0)
function! Scouter(file, ...)
  let pat = '^\s*$\|^\s*"'
  let lines = readfile(a:file)
  if !a:0 || !a:1
    let lines = split(substitute(join(lines, "\n"), '\n\s*\\', '', 'g'), "\n")
  endif
  return len(filter(lines,'v:val !~ pat'))
endfunction
"空行の削除
command! -nargs=0 Dsl execute s:deleteSpaceLine()
function! s:deleteSpaceLine()
  let i = 0
  let targets = []
  for bufline in getbufline(bufname(0), 1, "$")
    if !strlen(bufline)
      call add(targets, i)
    endif
    let i = i + 1
  endfor
  let i = 0
  for line in targets
    let line = line - i
    call cursor(line + 1, 0)
    let i = i + 1
    normal dd
  endfor
endfunction
" CakePHP、imgタグの変更
command! -nargs=0 CakeImgRegex execute s:cakeImgRegex()
function! s:cakeImgRegex()
  let row = 0
  let lines = getline(row, line("$"))
  let pat = '<img.\{-}>'
  for str in lines
    let row += 1
    if str =~? pat
      let match = matchstr(str, pat)
      let match = substitute(match, '<img.\{-}".\{-}"\zs.\{-}\ze[a-zA-Z]', ", array(", "g")
      let match = substitute(match, '<img src=".', '<?php echo $html->image("/front', "g")
      let match = substitute(match, '.>$', ")); ?>", "g")
      let pat_attr = 'array(\zs.\{-}\ze)'
      let attr = matchstr(match, pat_attr)
      let targets = split(attr, '"\zs ')
      let results = []
      let c = 0
      for target in targets
        if strlen(target) != 1
          if c != 0
            let target = ', "'.target
          else
            let target = '"'.target
          endif
          let target = substitute(target, '=', '" => ', "g")
          call add(results, target)
        endif
        let c+=1
      endfor
      let result = join(results)
      let match = substitute(match, pat_attr, result, "g")
      let match = substitute(str, pat, match, "g")
      call setline(row, match)
    endif
  endfor
endfunction



"Functionリストの作成
"command!
"    \   -bar -nargs=0 Navi execute s:navi()
"function! s:navi()
"  if &ft ==? "c" || &ft ==? "cpp"
"    vimgrep /^[^ \t#/\\*]\+[0-9A-Za-z_ :\t\\*]\+([^;]*$/j %
"  elseif &ft ==? "lisp" 
"    vimgrep /^[ \t]*(defun[ \t]\+.*$/j %
"  elseif &ft ==? "perl"
"    vimgrep /^[ \t]*sub[ \t]\+.*$/j %
"  elseif &ft ==? "ruby"
"    vimgrep /^[ \t]*\(class\|module\|def\|alias\)[ \t]\+.*$/j %
"  elseif &ft ==? "vim"
"    vimgrep /^[ \t]*\(class\|function\|function!\)[ \t]\+.*$/j %
"  elseif &ft ==? "python"
"    vimgrep /^[ \t]*\(class\|def\)[ \t]\+.*$/j %
"  elseif &ft ==? "php"
"    vimgrep /^[ \t]*\(class\|function\)[ \t]\+.*$/j %
"  elseif &ft ==? "javascript"
"    vimgrep /^[ \t]*function[ \t]\|[a-zA-Z_$][a-zA-Z0-9_$]*[ \t]*[=:][ \t]*function[ \t]*(/j %
"  elseif &ft ==? "sh"
"    vimgrep /^[ \t]*\(\h\w*[ \t]*()\|function[ \t]\+\h\w*\)/j %
"  elseif &ft ==? "html"
"    vimgrep /\c^\([ \t]*<h[123456].*\|[ \t]*<head.*\|[ \t]*<body.*\|[ \t]*<form.*\)$/j %
"  elseif &ft ==? ""
"    vimgrep /^[ \t]*[1234567890]\+[\.]\+.*$/j %
"  elseif &ft ==? "tex"
"    vimgrep /^\(\\chapter.*\|\\section.*\|\\subsection.*\|\\subsubsection.*\)$/j %
"  elseif &ft ==? "pascal" 
"    vimgrep /\c^procedure.*$/j %
"  elseif &ft ==? "java"
"    vimgrep /^[ \t]*[^#/\*=]\+[0-9a-zA-Z_ \t\*,.()]\+{[^;]*$/j %
"  elseif &ft ==? "vb"
"    vimgrep /\c^\(private\|public\|sub\|function\)[ \t]\+.*$/j %
"  elseif &ft ==? "diff"
"    vimgrep /^@@[0-9 \t,+-]\+@@$/j %
"  else
"    echo "This filetype is not supported."
"  endif
"endfunction
"Grep
"command! -nargs=* Grep execute s:mygrep(<f-args>)
"function! s:mygrep(file, pattern)
"  execute "vimgrep /".a:pattern."/gj **/".a:file
"endfunction

