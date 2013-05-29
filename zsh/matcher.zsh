_matcher_complete() {
  integer i=1
  (git ls-files 2>/dev/null || find .) | /usr/bin/env matcher -l20 ${words[CURRENT]} | while read line; do
    compadd -U -2 -V $i -- "$line"
    i=$((i+1))
  done
  compstate[insert]=menu
}

zle -C matcher-complete complete-word _generic
zstyle ':completion:matcher-complete:*' completer _matcher_complete
zstyle ':completion:matcher-complete:*' menu-select
bindkey '^[[Z' matcher-complete
