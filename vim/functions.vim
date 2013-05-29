function! RunWith(command)
  execute "w"
  execute "!clear;time " . a:command . " " . expand("%")
endfunction

silent! function! Reload()
  execute "source ~/.vimrc"
endfunction
