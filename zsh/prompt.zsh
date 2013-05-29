PR_GIT_UPDATE=1

setopt prompt_subst
autoload colors
colors

autoload -U add-zsh-hook
autoload -Uz vcs_info

turquoise="$fg[cyan]"
orange="$fg[yellow]"
purple="$fg[magenta]"
hotpink="$fg[red]"
limegreen="$fg[green]"

function prompt_char {
  git branch &> /dev/null && echo '±' && return
  echo '$'
}

# enable VCS systems you use
zstyle ':vcs_info:*' enable git

# check-for-changes can be really slow.
# you should disable it, if you work with large repositories
zstyle ':vcs_info:*:prompt:*' check-for-changes true

# set formats
# %b - branchname
# %u - unstagedstr (see below)
# %c - stagedstr (see below)
# %a - action (e.g. rebase-i)
# %R - repository path
# %S - path in the repository
PR_RST="%{${reset_color}%}"
FMT_BRANCH="(%{$turquoise%}%b%u%c${PR_RST})"
FMT_ACTION="(%{$limegreen%}%a${PR_RST})"
FMT_UNSTAGED="%{$orange%}●"
FMT_STAGED="%{$limegreen%}●"

zstyle ':vcs_info:*:prompt:*' unstagedstr "${FMT_UNSTAGED}"
zstyle ':vcs_info:*:prompt:*' stagedstr "${FMT_STAGED}"
zstyle ':vcs_info:*:prompt:*' actionformats "${FMT_BRANCH}${FMT_ACTION}"
zstyle ':vcs_info:*:prompt:*' formats "${FMT_BRANCH}"
zstyle ':vcs_info:*:prompt:*' nvcsformats ""

RPROMPT='${vim_mode}'
PROMPT='
%{$fg[yellow]%}%n%{$reset_color%} at %{$fg[cyan]%}$(uname -n)%{$reset_color%} in %{$fg[red]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)
$(prompt_char) '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

vim_ins_mode=""
vim_cmd_mode="[CMD]"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish
