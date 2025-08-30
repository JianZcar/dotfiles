# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs=
export EDITOR="nvim"

# so npm wont pollute the $HOME dir
export TMP_NPMRC=$(mktemp)
echo "cache=~/.local/share/npm/" > $TMP_NPMRC
echo "logs-dir=~/.local/share/npm/_logs/" >> $TMP_NPMRC
echo "update-notifier=false" >> $TMP_NPMRC
export NPM_CONFIG_USERCONFIG=$TMP_NPMRC

export JAVA_TOOL_OPTIONS="-Duser.home=$HOME/.cache/java"
