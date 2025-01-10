# .bashrc
test
# Uses fish as default shell
if [ -n "$PS1" ] && [ -z "$FISH" ] && [ -x "/bin/fish" ]; then
    export FISH=1
    shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=''
		exec fish $LOGIN_OPTION
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

PS1=$(source .prompt $PWD bash)

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
