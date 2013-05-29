PATH="./.bundle/binstubs:$DOTFILES/bin:$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"

[[ -d "$HOME/.rbenv" ]] && PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"

export PATH
