alias ls='ls --color=auto'
alias ll='ls -lh'
alias lla='ls -lhA'
alias la='ls -A'
alias l='ls -CF'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- -="cd -"                  # Go to previous dir with -
alias cd.='cd $(readlink -f .)'    # Go to real dir (i.e. if current dir is linked)

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias g='git'
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias gs='git status -sb --show-stash'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative'

# Clipboard, usage: echo test | pbcopy; echo < $(pbpaste)
alias pbcopy='xclip -in -rmlastnl -selection clipboard'
alias pbpaste='xclip -out -selection clipboard'

alias svenv='source venv/bin/activate'

# type fuck if you forgot sudo
alias fuck='sudo $(history -p !!)'

# Package management
alias update='sudo apt update && sudo apt upgrade && sudo apt autoremove'
alias install='sudo apt install'
alias remove='sudo apt remove'
alias search='apt-cache search'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

alias week="date +%V" # print week number
alias speedtest="wget -O /dev/null http://speed.transip.nl/100mb.bin"

