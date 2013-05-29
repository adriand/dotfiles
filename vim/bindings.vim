" lead with spacebar
let mapleader = " "

" toggle insert mode with ✓ or F8, which is what i've rebound
" caps lock to on my two computers
imap ✓ <ESC>
map ✓ <ESC>
nnoremap ✓ i
imap <F8> <ESC>
map <F8> <ESC>
nnoremap <F8> i

" fast save and exit
nmap <silent> <CR> :write<CR>
nmap <silent> Q :quit<CR>
nmap <silent> QQ :quit!<CR>

" quick redo (remember we use check/f8 for insert mode, so i is unused)
nnoremap i <C-r>

" navigate through paragraphs intelligently
map j gj
map k gk

" navigate between methods
map J ]m
map K [m

" replace those binds
noremap <leader>j J
noremap <leader>k K

" ctrl navigates between splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" leader navigates between tabs
map <leader>h :tabprevious<CR>
map <leader>l :tabnext<CR>

" scale splits with the arrow keys
map <Down> <C-w>-
map <Left> <C-w><
map <Right> <C-w>>
map <Up> <C-w>+

" open new splits with vv
nmap vv <C-w><C-v><C-w>l
nmap VV <C-w><C-s><C-w>j

" open new tabs with tt
nmap tt :tabnew<CR>

" map ctrlp's tag feature to <C-o>
nmap <silent> <C-o> :CtrlPTag<CR>

" quickly open tags -- combine with zz to go back
nnoremap <leader>f <C-]>

" quickly open ag.vim
nmap <leader>a :Ag 

" move back and forth through previous and next buffers
nmap <silent> <leader>x :bn<CR>
nmap <silent> <leader>z :bp<CR>
nmap zz <C-^>

" make Y consistent with D and C
map Y y$

" quick sort
map <silent> <leader>s :sort<CR>

" quick splitjoin
nmap <silent> <leader>sp :SplitjoinSplit<CR>
nmap <silent> <leader>sj :SplitjoinJoin<CR>

" reset ctrlp's cache
map <silent> <leader>ma :!hg addremove<CR>:CtrlPClearCache<CR>

" use magic regexps by default
nnoremap / /\v
nnoremap ? ?\v
nmap <leader>g :g/\v
nmap <leader>s :s/\v
