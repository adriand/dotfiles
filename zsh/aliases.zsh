for scr in git vim workon; do
  alias "${scr:0:1}"="$scr"
done

alias "1st"="awk '{ print \$1 }'"
alias "2nd"="awk '{ print \$2 }'"
alias "3rd"="awk '{ print \$3 }'"

for i in $(seq 4 9); do
  alias "${i}th"="awk '{ print \$$i }'"
done
