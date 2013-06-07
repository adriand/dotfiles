" runners on <leader>r
autocmd FileType coffee nmap <leader>r :call RunWith("coffee")<CR>
autocmd FileType markdown nmap <leader>r :!epdfview $(md2pdf < %)<CR> 
autocmd FileType ruby nmap <leader>r :call RunWith("ruby")<CR>
autocmd FileType vim nmap <leader>r :source %<CR> 
autocmd FileType javascript nmap <leader>r :call RunWith("node")<CR>

" superficial runners on <leader>R
autocmd BufRead *_spec.rb nmap <leader>R :call RunWith("rspec")<CR>

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
