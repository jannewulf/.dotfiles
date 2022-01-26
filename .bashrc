# ~/.bashrc has anything you'd want at an interactive command line. Command prompt, EDITOR variable, bash aliases for my use
# ~/.bashrc must not output anything
# https://superuser.com/a/789465

# do nothing if shell is not interactive to not break e.g. sftp
# https://superuser.com/a/789499
[[ $- == *i* ]] || return 0

# Run tmux
#if command -v tmux &> /dev/null && \
#   [ -n "$PS1" ] && \
#   [[ ! "$TERM" =~ screen ]] && \
#   [[ ! "$TERM" =~ tmux ]] && \
#   [ -z "$TMUX" ]; then
#  exec tmux
#fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# append to the history file, don't overwrite it and do that with each command executed
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
HISTCONTROL=ignoreboth
HISTSIZE=2000
HISTFILESIZE=20000

# check if this is a ssh session
SESSION_TYPE=local
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  SESSION_TYPE=remote/ssh
else
  case $(ps -o comm= -p $PPID) in
    sshd|*/sshd) SESSION_TYPE=remote/ssh;;
  esac
fi

# set prompt
PROMPT_COMMAND="__prompt_command;$PROMPT_COMMAND"
function __prompt_command() {
  local EXIT="$?"
  PS1=""

  # solarized foreground colors
  local base03_fg='\[\e[38;5;234m\]'
  local base02_fg='\[\e[38;5;235m\]'
  local base01_fg='\[\e[38;5;240m\]'
  local base00_fg='\[\e[38;5;241m\]'
  local base3_fg='\[\e[38;5;244m\]'
  local base2_fg='\[\e[38;5;245m\]'
  local base1_fg='\[\e[38;5;254m\]'
  local base0_fg='\[\e[38;5;230m\]'
  local yellow_fg='\[\e[38;5;136m\]'
  local orange_fg='\[\e[38;5;166m\]'
  local red_fg='\[\e[38;5;160m\]'
  local magenta_fg='\[\e[38;5;125m\]'
  local violet_fg='\[\e[38;5;61m\]'
  local blue_fg='\[\e[38;5;33m\]'
  local cyan_fg='\[\e[38;5;37m\]'
  local green_fg='\[\e[38;5;64m\]'

  local default_color='\[\e[39m\]'

  if [ $SESSION_TYPE = "remote/ssh" ]; then
    local user_info="[$(whoami)@$(hostname)]"
  else
    local user_info="[$(whoami)]"
  fi
  PS1+="${yellow_fg}${user_info}${default_color}"

  if git branch >/dev/null 2>/dev/null; then
    local git_branch=$(git branch 2>/dev/null | grep -E '^\* .*' | sed 's/* //')
    PS1+=" ${magenta_fg}[${git_branch}]${default_color}"
  fi

  if [[ $VIRTUAL_ENV ]]; then
    PS1+=" ${blue_fg}[$(basename $VIRTUAL_ENV)]${default_color}"
  fi

  PS1+=" :: "

  PS1+="${cyan_fg}\W${default_color}"

  if [ "$EXIT" != "0" ]; then
    PS1+="${base01_fg} ${EXIT}${default_color}"
  fi

  PS1+=" > "
}

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_fn ]; then
    . ~/.bash_fn
fi

if [ -f ~/.bash_complete ]; then
    . ~/.bash_complete
fi

if [ -f ~/.bashrc.local ]; then
    . ~/.bashrc.local
fi

