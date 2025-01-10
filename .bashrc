# .bashrc
# Use Fish by default
if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} && -x "/bin/fish" ]]; then
  shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=''
  exec fish $LOGIN_OPTION
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

function parse_git_branch {
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    local branch
    branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
      local status=""
      local ahead=$(git rev-list --count @{u}..HEAD 2>/dev/null)
      local behind=$(git rev-list --count HEAD..@{u} 2>/dev/null)
      if [ -n "$ahead" ] && [ "$ahead" -gt 0 ]; then
        status+="$(printf '\ueb71')" 
      fi
      if [ -n "$behind" ] && [ "$behind" -gt 0 ]; then
        status+="$(printf '\ueb6e')" 
      fi
      echo "[$branch$status]"
    fi
  fi
}

PS1='\[\e[32m\][\[\e[34m\]\u@\h \[\e[35m\]bash \[\e[33m\]\W\[\e[32m\]$(parse_git_branch)\[\e[32m\]]> \[\e[0m\]'

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
