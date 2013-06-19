" other type-specific junk
autocmd BufRead /tmp/mutt-* setlocal syntax=markdown

autocmd FileType markdown nmap <leader>1 yypVr=
autocmd FileType markdown nmap <leader>2 yypVr-
autocmd FileType markdown nmap <leader>3 I### <ESC>
autocmd FileType markdown setlocal spell

autocmd FileType python setlocal shiftwidth=4
autocmd FileType python setlocal softtabstop=4

autocmd FileType ruby,haml,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,haml,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,haml,eruby setlocal omnifunc=rubycomplete#Complete

" ruby/rails specific things
if filereadable("Gemfile")
  nmap <leader>bo :Bopen 
  nmap <leader>rg :Rgenerate 
  nmap <silent> <leader>rc :Rcontroller<CR>
  nmap <silent> <leader>rm :Rmodel<CR>
  nmap <silent> <leader>rv :Rview<CR>
endif

" resize splits when vim is resized
autocmd VimResized * wincmd =
