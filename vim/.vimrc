""""""""""""""""""""""""""""""
" defaults.vimの読込
""""""""""""""""""""""""""""""
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

""""""""""""""""""""""""""""""
" 各種オプションの設定
""""""""""""""""""""""""""""""
" タブ入力を複数の空白入力に置き換える
set expandtab
" タブ、空白、改行を可視化する
set list
set listchars=tab:»-,trail:_,eol:↲,extends:»,precedes:«,nbsp:%
" 行番号を表示する
set number
" タブ文字の表示幅を変更する
set tabstop=2
" Vimが挿入するインデントの幅を変更する
set shiftwidth=2