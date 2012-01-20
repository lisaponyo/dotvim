"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""Basics
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :set number? "現在の値を表示
" :set number& "デフォルト値に戻す
" :set number! "On/Offのトグル
autocmd!
syntax on                                "構文ハイライト機能On
filetype plugin indent on                "ファイル形式の判別。ファイル形式に沿ったプラグインの読み込み
set nocompatible                         "vi互換モードを非動作
set enc=utf-8                            "文字コードUTF8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932 "文字コードUTF8
set fileformats=unix,mac,dos             "ファイルフォーマット
set ambiwidth=double
set history=1000                         "コマンド履歴
set autochdir                            "編集中ファイルのディレクトリに自動cd
set noswapfile                           "Swapを作成しない
set updatecount=0                        "Swapを作成する打鍵数。0ならSwapを作成しない
set grepprg=internal                     "GrepはVim標準を使用。環境に左右されない
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""検索関係
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase "大文字/小文字を区別しない
set smartcase  "ignorecase時大文字が混じったら大文字小文字を区別
set wrapscan   "最下部まで検索したら最初に戻る
set incsearch  "文字列入力中にマッチ文字列に自動移動
set hlsearch   "マッチ文字をハイライト表示
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""文字表示関係
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set list                                     "非表示文字の表示
set listchars=tab:>-,extends:<,trail:-,eol:$ "非表示文字の表現
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""文字入力関係
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab                  "タブを空白に
set tabstop=2                  "ハードタブ画面表示幅
set shiftwidth=2               "インデント幅
set backspace=indent,eol,start "BackSpaceがちゃんと消せるように
set smarttab                   "shiftwidthに合わせた行頭インデント
set autoindent                 "自動インデントOn
set showmatch                  "閉じ括弧入力時、対応する開き括弧にわずかの間移動
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""Window表示関係
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noruler         "カーソル行列の非表示
set number          "行番号表示
set wrap            "長い文字は折り返し表示
set title           "Windowタイトル表示
set cmdheight=2     "コマンドラインの行数
set laststatus=2    "ステータス行を常に表示
set statusline=\ [%n]\ %f\%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%l,%c)
set wildmenu        "コマンドライン入力の補完
set nobackup        "ファイル上書き時のバックアップはいらない
set scrolloff=3     "カーソル位置から上下は常に表示
set sidescrolloff=3 "カーソル位置から上下は常に表示
set showcmd "入力コマンドを画面下部に表示
set imsearch=1
set iminsert=1
set cursorline             "カーソル行をハイライト
set ttyfast                "高速ターミナル接続
set lazyredraw             "コマンド実行中は再描画しない
set display=uhex           "印字不可能文字を16進数で表示"
set t_Co=256               "use 256 colors
set matchpairs&            "<>にもマッチするようにする
set matchpairs+=<:>        "<>にもマッチするようにする
set formatoptions=qlromM   "折り返し設定
set complete=.,w,b,u,t,i,k "補完候補設定
set virtualedit=block

set cpoptions-=m              "移動キーを押しても括弧の強調を有効にする
set matchtime=3               "移動キーを押しても括弧の強調を有効にする
set showtabline=2             "タブは常に表示
set noequalalways             "Windowサイズ自動調整を無効
set winheight=10               "Window(current)サイズ
set winminheight=3             "Window(another)サイズ
set hidden                    "未保存でも別ファイルを開けるように(Buffer to Hidden)
set whichwrap=b,s,h,l,<,>,[,] "行末から次の行へ移動できるように
set helplang=ja,en            "helpの優先順位
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set notagbsearch              "Tagsの検索に効率の悪い線形探索を使用(HelptagsのVimバグ対応)

""""""""""""""""""""""Colors"""""""""""""""""""""
scriptencoding utf-8
augroup highlightIdegraphicSpace
  autocmd!
  autocmd Colorscheme       * highlight IdeographicSpace term=underline ctermbg=DarkCyan guibg=DarkCyan
  autocmd VimEnter,WinEnter * match     IdeographicSpace /　/
augroup END
let g:solarized_italic=0
let g:solarized_termcolors=256
set background=dark
colorscheme lucius

autocmd QuickfixCmdPost make,grep,vimgrep, cwin
autocmd BufNewFile,BufRead * execute ':lcd %:p:h'
autocmd BufNewFile,BufRead *.vb setfiletype vbnet
""""""""""""""""""""気分で変える設定たち""""""""""""""""""""
"set autowrite "自動保存
"set updatetime=50 "CursorHold、CursorHoldIを拾うタイミング(ミリ秒)
"autocmd CursorHold  * wall "自動保存
"autocmd CursorHoldI * wall "自動保存(Insertモード時)
"set clipboard=unnamed "WindowsとClipboardを共有
""Save fold settings.
"autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview |        endif
"autocmd BufRead      * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview |     endif
""Don't save options.
"set viewoptions&
"set viewoptions-=options
"set copyindent                 "前の行のインデントを引き継ぐ
"set preserveindent             "インデント構造を保つ
"set cindent "C言語ライクなインデント
"set imdisable      "インプットメソッドの無効化
"set background=dark
"set winwidth=30               "Window(current)サイズ
"set winminwidth=3             "Window(another)サイズ
