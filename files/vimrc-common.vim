" Terminal from Windows: Use git-bash.exe, not CMD/Windows Terminal that send wrong xterm codes.
" UPDATE: maybe you want to use 'micro' editor instead of this mess :-)

" Put this e.g in /etc/profile.d/vimrc-comun and source it from your .vimrc:
"   source /etc/profile.d/vimrc-comun.vim
" with plugin (see bottom) Contro-C copies to terminal clipboard when in visual mode

" This .vimrc allows to use "vim easy" work like, but keeping the clasical vim
" Valid for common vim and gvim

" to Enter ESC charater do i_Ctrl-K EC
" see: http://vimdoc.sourceforge.net/htmldoc/digraph.html#digraphs
" insert mode i_Ctrl-V remaped to i_Ctrl-F to avoid issues with Ctrl-V as paste on Windows Terminal

search option

" prevent exit visualmode when indenting block
:vnoremap < <gv
:vnoremap > >gv

set ignorecase

" quick enter insert mode
map <Space> i
map <Backspace> i<Backspace>
" WARNING:   map ^[OF i<End>    if you copypaste this from internet, first ^[ is ESC character, i_Ctrl-K EC
map OF i<End>

" -- block indent/unindent with tab and shift-tab
map <Tab> i<Tab>
vmap <Tab> >
" -- shift tab
" WARNING:   vmap ^[[Z <         if you copypaste this from internet, first ^[ is ESC character, i_Ctrl-K EC
map [Z <Esc><i
imap [Z <Backspace>
vmap [Z <

map <Del> i<Del>
map <Enter> i<Enter>
imap <C-o> <Esc>o

" -- copy paste with ctrl-c/x/v/z
imap <C-c> <Esc>"+yyi
map <C-c> "+yyi
imap <C-y> <Esc>"+yyi
map <C-y> "+yyi

imap <C-c> <Esc>"+yyi

" --  insert literal character remapped to C-f
inoremap <C-f> <C-v>
imap <C-v> <Esc>pi
"-- 'visual block mode' remapped to C-f
noremap <C-f> <C-v>  
map <C-v> pi
imap <C-p> <Esc>pi
map <C-p> pi

imap <C-x> <Esc>ddi
map <C-x> ddi

imap <C-z> <Esc>ui
map <C-z> u

"vmap <C-c> yi
" copy to terminal clipboard OSC52, when in visual mode
vmap <C-c> :OSCYank<CR>
vmap <C-x> di
vmap c y


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
imap  <S-Left>
map  <S-Left>
vmap  <S-Left>

imap  <S-Right>
map  <S-Right>
vmap  <S-Right>

imap µ <S-Up>
map µ <S-Up>
vmap µ <S-Up>

imap  <S-Down>
map  <S-Down>
vmap  <S-Down>

set shortmess=a

" -------------------------- VIM-PLUG PLUGINS
" first install: curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Remember to do :PlugInstall after addin new plugins

call plug#begin('~/.vim/plugged')

" copy/paste terminal clipboard (OSC 52)
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
Plug 'ojroques/vim-oscyank'

call plug#end()


