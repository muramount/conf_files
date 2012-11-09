"set autoindent
set number
set expandtab
set tabstop=4
set shiftwidth=4
set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/backup
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

"set tags=/var/www/html/murayama/tags
