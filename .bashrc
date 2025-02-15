# .bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

function init_pyenv {
	export PYENV_ROOT="$HOME/.pyenv"
	[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init - bash)"
	eval "$(pyenv virtualenv-init -)"
}

function dev_env {
	# init_pyenv
	echo Dev Container - $(grep "^PRETTY_NAME" /etc/os-release | cut -d= -f2 | tr -d '"') &
}

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

distro_id=${CONTAINER_ID}
if [ -n "$distro_id" ]; then
    if [ "$distro_id" == "Dev" ]; then
			dev_env
    fi
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

export EDITOR="hx"

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Uses fish as default shell
if [ -n "$PS1" ] && [ -z "$FISH" ] && [ -x "/bin/fish" ]; then
    export FISH=1
    shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=''
		exec fish $LOGIN_OPTION
fi

function update_prompt {
		VENV_PROMPT="${VIRTUAL_ENV:+($(basename "$VIRTUAL_ENV")) }"
		Prompt="${VENV_PROMPT}$(~/.local/bin/prompt "bash")"
    PS1="$Prompt"
}

PROMPT_COMMAND=update_prompt
PS1=$Prompt

