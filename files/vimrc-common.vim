" Put this e.g in /etc/profile.d/vimrc-comun and source it from your .vimrc:
"   source /etc/profile.d/vimrc-comun.vim

" For clipboard you need to vim --version have +clipboard and +xterm_clipboard (with +, not -)
" Install gvim : apt install vim-gnome
" This .vimrc allows to use "vim easy" work like, but keeping the clasical vim
" Valid for common vim and gvim


" search option
set ignorecase

" quick enter insert mode
map <Space> i
map <Backspace> i<Backspace>
map <Del> i<Del>
map <Enter> i<Enter>
imap <C-o> <Esc>o


" stetics
colorscheme industry
set guifont=Noto\ Mono\ 14
set belloff=all

" desktop clipboard
set clipboard=unnamedplus

" status line
" set laststatus=2
set number

" window commands from insert mode
inoremap <C-w> <Esc><C-w>

map <F1> <Esc>:
imap <F1> <Esc>:

" quick save
map <F2> <Esc>:w<Enter>i
imap <F2> <Esc>:w<Enter>i

" ctrl-c/x/v/z
imap <C-c> <Esc>"+yyi
map <C-c> "+yyi
imap <C-y> <Esc>"+yyi
map <C-y> "+yyi

imap <C-v> <Esc>pi
"commented to preserve 'visual block mode'
"map <C-v> pi
imap <C-p> <Esc>pi
map <C-p> pi

imap <C-x> <Esc>ddi
map <C-x> ddi

imap <C-z> <Esc>ui
map <C-z> u

vmap <C-c> yi
vmap <C-x> di
vmap c y




" shift arrow to select
imap <S-Left> <Esc>v<Left>
map <S-Left> v<Left>
vmap <S-Left> <Left>

imap <S-Right> <Esc>v<Right>
map <S-Right> v<Right>
vmap <S-Right> <Right>

imap <S-Up> <Esc>v<Up>
map <S-Up> v<Up>
vmap <S-Up> <Up>

imap <S-Down> <Esc>v<Down>
map <S-Down> v<Down>
vmap <S-Down> <Down>

" to play with shift-S,D,F,E defined in symbols/es
imap « <S-Left>
map « <S-Left>
vmap « <S-Left>

imap » <S-Right>
map » <S-Right>
vmap » <S-Right>

imap µ <S-Up>
map µ <S-Up>
vmap µ <S-Up>

imap ¶ <S-Down>
map ¶ <S-Down>
vmap ¶ <S-Down>