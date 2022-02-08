# ~/.bashrc has anything you'd want at an interactive command line. Command prompt, EDITOR variable, bash aliases for my use
# ~/.bashrc must not output anything
# https://superuser.com/a/789465

# do nothing if shell is not interactive to not break e.g. sftp
# https://superuser.com/a/789499
[[ $- == *i* ]] || return 0

# update LINES and COLUMNS variables after each command
shopt -s checkwinsize

# append to the history file, don't overwrite it and do that with each command executed
shopt -s histappend
PROMPT_COMMAND="history -a"
HISTCONTROL=ignoreboth
HISTSIZE=2000
HISTFILESIZE=20000

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

# set prompt
PROMPT_COMMAND="__prompt_command; $PROMPT_COMMAND"
function __prompt_command() {
  local exit_code="$?"

  local reset='\[\e[0m\]'
  local black='\[\e[0;30m\]'
  local yellow='\[\e[0;33m\]'
  local blue='\[\e[0;34m\]'
  local magenta='\[\e[0;35m\]'
  local cyan='\[\e[0;36m\]'

  local user_info
  local git_branch
  local virtual_env
  local exit_code_str

  if [[ "$SESSION_TYPE" = "remote/ssh" ]]; then
    user_info="${yellow}[$(whoami)@$(hostname)]${reset} "
  else
    user_info="${yellow}[$(whoami)]${reset} "
  fi

  if git branch &>/dev/null; then
    git_branch="${magenta}[$(git branch --show-current)]${reset} "
  fi

  if [[ "$VIRTUAL_ENV" ]]; then
    virtual_env="${blue}[$(basename "$VIRTUAL_ENV")]${reset} "
  fi

  if [[ "$exit_code" != "0" ]]; then
    exit_code_str="${black} ${EXIT}${reset} "
  fi

  PS1="${user_info}${git_branch}${virtual_env}:: ${cyan}\W${reset} ${exit_code_str}❯ "
}

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_complete ]; then
    . ~/.bash_complete
fi


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

