echo "$(date): ${ZDOTDIR}/.zshrc" >> startup-routine

[[ $- == *i* ]] || return 0

export EDITOR=vim
export VISUAL=vim

HISTSIZE=20000
SAVEHIST=20000
HISTFILE="${XDG_DATA_HOME}/zsh/history"
[ -d "${XDG_DATA_HOME}/zsh" ] || mkdir -p "${XDG_DATA_HOME}/zsh"
setopt APPEND_HISTORY
setopt HIST_SAVE_NO_DUPS

# Notify immediately about state changes of bg processes
setopt notify

# vi mode
bindkey -v

# Cannot be defined in .local/bin because 'cd' would only affect the subshell
function mkcd() {
  mkdir -p "$@" && cd "$1"
}

function check_dotfile_changes() {
  local branch_info
  local upstream
  local downstream
  which yadm &>/dev/null || return
  branch_info=$(yadm rev-list --left-right --count master...origin/master)
  upstream=$(echo "$branch_info" | awk '{print $1}')
  downstream=$(echo "$branch_info" | awk '{print $2}')
  [[ "$upstream" != "0" ]] && echo "You should push changes to the dotfiles."
  [[ "$downstream" != "0" ]] && echo "You should pull changes to the dotfile."
}
check_dotfile_changes

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

source "${XDG_CONFIG_HOME}/zsh/alias"
source "${XDG_CONFIG_HOME}/zsh/completion"

fpath=("${XDG_CONFIG_HOME}/zsh/prompt" $fpath)
autoload -Uz prompt_setup; prompt_setup

