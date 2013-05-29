" ctrlp
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/]tmp$'
      \ }
let g:ctrlp_user_command = {
      \ 'types': {
      \ 1: ['.git', 'cd %s && git ls-files'],
      \ 2: ['.hg', 'hg --cwd %s locate -I .'],
      \ },
      \ 'fallback': 'find %s -type f'
      \ }

" syntastic
let g:syntastic_javascript_checkers = ["jshint"]
let g:syntastic_ruby_checkers = ["mri"]

" youcompleteme
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_global_ycm_extra_conf = $DOTFILES . "/vim/ycm_extra_conf.py"

" startify
let g:startify_bookmarks = [ $HOME . "/.vimrc" ]
