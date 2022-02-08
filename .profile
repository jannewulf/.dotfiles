# ~/.profile has the stuff NOT specifically related to bash, such as environment variables (PATH and friends)
# Anything that should be available to graphical applications OR to sh (or bash invoked as sh) MUST be in ~/.profile
# Anything that should be available only to login shells should go in ~/.profile
# https://superuser.com/a/789465

PATH="$HOME/.local/bin:$PATH"

# check if this is a ssh session
SESSION_TYPE=local
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  SESSION_TYPE=remote/ssh
else
  case $(ps -o comm= -p $PPID) in
    sshd|*/sshd) SESSION_TYPE=remote/ssh;;
  esac
fi

