if command -v xsel &> /dev/null && ! command -v pbcopy &>/dev/null; then
  alias pbcopy='xsel -ib'
  alias pbpaste='xsel -o'
fi

nocorrect=( rails guard rspec npm cap )
noglob=( rake )

for scr in $nocorrect; do alias "$scr"="nocorrect $scr"; done
for scr in $noglob; do alias "$scr"="noglob $scr"; done

alias 1st="awk '{ print \$1 }'"
alias 2nd="awk '{ print \$2 }'"
alias 3rd="awk '{ print \$3 }'"
alias 4th="awk '{ print \$4 }'"
alias 5th="awk '{ print \$5 }'"
alias 6th="awk '{ print \$6 }'"
alias 7th="awk '{ print \$7 }'"
alias 8th="awk '{ print \$8 }'"
alias 9th="awk '{ print \$9 }'"
