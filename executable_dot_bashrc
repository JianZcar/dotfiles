# .bashrc
function init_pyenv {
	export PYENV_ROOT="$HOME/.pyenv"
	[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init - bash)"
	eval "$(pyenv virtualenv-init -)"
}

distro_id=${CONTAINER_ID}

if [ -z "$distro_id" ]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else
	echo Distrobox - $(grep "^PRETTY_NAME" /etc/os-release | cut -d= -f2 | tr -d '"') &
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi
unset rc

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

if [ -n "$PS1" ]; then
  eval "$(starship init bash)"
  if [ -z "$NVIM" ] && which nvim >/dev/null 2>&1; then
    nvim +terminal
    exit
  fi
  if [ -n "$FISH" ] && [ -n "$NVIM" ]; then
      unset FISH
  fi
  if [ -z "$FISH" ] && [ -z "$NVIM_TERM" ] && [ -x "/bin/fish" ]; then
    export FISH=1
    [ -n "$NVIM" ] && export NVIM_TERM=1
    shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=''
    exec fish $LOGIN_OPTION
  fi
fi
