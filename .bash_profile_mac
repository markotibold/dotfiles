# brew bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Load .aliases
source ~/.dotfiles/.aliases

# Load .bash_prompt
source ~/.dotfiles/.bash_prompt

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# virtualenvwrapper related
source /usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME="~/mac_envs"
export PATH="/usr/local/bin:/usr/local/mysql/bin:$PATH"

# Hack for mysql-python, TODO really solve this
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

