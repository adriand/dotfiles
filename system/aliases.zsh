if command -v xsel &> /dev/null && ! command -v pbcopy &>/dev/null; then
  alias "pbcopy"='xsel -ib'
  alias "pbpaste"='xsel -o'
fi

for scr in rails rspec cap; do
  if command -v "$scr" &> /dev/null; then
    alias "$scr"="nocorrect $scr";
  fi
done

for scr in rake; do
  if command -v "$scr" &> /dev/null; then
    alias "$scr"="noglob $scr";
  fi
done

for scr in git vim workon xdg-open; do
  if command -v "$scr" &> /dev/null; then
    alias "${scr:0:1}"="$scr"
  fi
done

if command -v hub &> /dev/null; then
  eval "$(hub alias -s)"
fi

alias "1st"="awk '{ print \$1 }'"
alias "2nd"="awk '{ print \$2 }'"
alias "3rd"="awk '{ print \$3 }'"

for i in $(seq 4 9); do
  alias "${i}th"="awk '{ print \$$i }'"
done
