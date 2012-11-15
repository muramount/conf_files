" Vi互換モードをオフ（Vimの拡張機能を有効）
set nocompatible
"ハイライト表示オン
syntax on

set autoindent                  "オートインクリメント
set number                      "行番号表示
set expandtab                   "タブの代わりに半角スペース
set tabstop=4                   "タブ画面上の見た目
set shiftwidth=4                "シフト移動幅
set ignorecase                  "大文字/小文字を区別しない
set smartcase                   "ignorecase時大文字が混じったら大文字小文字を区別
set wrapscan                    "最下部まで検索したら最初に戻る
set hlsearch                    "マッチ文字をハイライト表示
set wrap                        "長い文字は折り返し表示
set title                       "Windowタイトル表示
set cmdheight=2                 "コマンドラインの行数
set laststatus=2                "ステータス行を常に表示
set scrolloff=3                 "カーソル位置から上下は常に表示
set sidescrolloff=3             "カーソル位置から上下は常に表示
set showcmd                     "入力コマンドを画面下部に表示
set display=uhex                "印字不可能文字を16進数で表示
set cursorline                  "カーソル行をハイライト
set cursorcolumn                "カーソル列をハイライト
set showtabline=2               "タブは常に表示
set whichwrap=b,s,h,l,<,>,[,]   "行末から次の行へ移動できるように
set confirm                     "変更後終了時エラーではなく確認を求める
set ambiwidth=double            "□とか○の文字があってもカーソル位置がずれないようにする
set backspace=indent,eol,start  "バックスペースを有効

"バックアップ設定
set backup
set backupdir=$HOME/.vim/backup
set swapfile
set directory=$HOME/.vim/swap

"エンコーディング設定
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8

"==autocmd filetype detect== {{{
autocmd BufRead,BufNewFile *.thtml call s:php_detect_settings() "thtmlをphpファイルとして認識
autocmd BufRead,BufNewFile *.ctp setfiletype php "ctpをphpファイルとして認識
autocmd BufRead,BufNewFile *.tpl setfiletype php "tplをphpファイルとして認識
autocmd BufRead,BufNewFile *.sp setfiletype php "spをphpファイルとして認識
function! s:php_detect_settings()
  setfiletype php
  setlocal noexpandtab
  setlocal autoindent
endfunction

"カラー指定
highlight CursorLine cterm=none ctermbg=black "カーソル行ハイライト色設定
highlight CursorColumn ctermbg=none           "カーソル列ハイライトなし
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666

"全角スペースを可視化
"au BufNewFile,BufRead * match ZenkakuSpace /　/
" 行末の空白文字を可視化
highlight WhitespaceEOL cterm=underline ctermbg=red guibg=#FF0000
au BufWinEnter * let w:m1 = matchadd("WhitespaceEOL", ' +$')
au WinEnter * let w:m1 = matchadd("WhitespaceEOL", ' +$')

" 行頭のTAB文字を可視化
highlight TabString ctermbg=red guibg=red
au BufWinEnter * let w:m2 = matchadd("TabString", '^\t+')
au WinEnter * let w:m2 = matchadd("TabString", '^\t+')

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermbg=red guibg=#666666
au BufWinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')
au WinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')

"キーマップ 
"挿入モードで移動
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

"括弧 引用符をセット入力時戻る
inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap () ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap <> <><LEFT>

"バックスペースが無反応 or DELETE 状態になっている場合
"noremap   
"noremap!  
"noremap 
"noremap! 

"ctag設定
"set tags=/var/www/html/murayama/tags
