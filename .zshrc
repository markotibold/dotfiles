# If you come from bash you might have to change your $PATH.
    # export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/m.tibold/.oh-my-zsh

# zlib fix for transcoders project
export CPATH="/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.14.sdk/usr/include"

export TERM=xterm-256color-italic
#export TERM=tmux-256color-italic
# Set name of the theme to load. Optionally, if you set this to "random"
    # it'll load a random theme each time that oh-my-zsh is loaded.
    # See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
    ZSH_THEME="agnoster"
    #ZSH_THEME="blinks"

    DEFAULT_USER='m.tibold'

# Uncomment the following line to use case-sensitive completion.
    # CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
    # sensitive completion must be off. _ and - will be interchangeable.
    # HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
    # COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
    # under VCS as dirty. This makes repository status check for large repositories
        # much, much faster.
        # DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
    # stamp shown in the history command output.
    # The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
    # HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-flow)

source $ZSH/oh-my-zsh.sh
source ~/.dotfiles/bin/tmuxinator.zsh
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
    # if [[ -n $SSH_CONNECTION ]]; then
        #   export EDITOR='vim'
        # else
            #   export EDITOR='mvim'
            # fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
    #
    # Example aliases
    # alias zshconfig="mate ~/.zshrc"
    # alias ohmyzsh="mate ~/.oh-my-zsh"
    alias ssh="TERM=xterm-256color ssh"

    export EDITOR=vim
    export VISUAL=nvim
    source ~/.dotfiles/.aliases

    #export WORKON_HOME=$HOME/envs
    #export PROJECT_HOME=$HOME/Devel
    #source /usr/local/bin/virtualenvwrapper.sh
    #export LC_ALL=en_US.utf8
    # brew installed python
    export PATH="/usr/local/opt/python/libexec/bin:$PATH"
    export FZF_DEFAULT_COMMAND='
    (git ls-tree -r --name-only HEAD ||
        find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
        sed s/^..//) 2> /dev/null'

    prompt_dir() {
        prompt_segment blue black '%2~'
    }
export GOPATH=$HOME/go
export JAVA_HOME=$(/usr/libexec/java_home)

fpath+=~/.zfunc
export TERRIBLE_EXPERIMENTAL=true
alias terrible="/Users/m.tibold/code/tfmod-check/wrap.sh"

export PATH="/Users/m.tibold/.dotfiles/bin:$PATH"

# Below libs installed by brew, but header files required by pyenv
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/sqlite/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/sqlite/include"
#export PYTHON_CONFIGURE_OPTS="--enable-framework"


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

source ~/.poetry/env
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi


# usage:
# source mfa.sh
# mfa <your mfa-token here that you use for the aws console as well>
#$(aws ecr get-login --no-include-email --region eu-west-1)
mfa() {
    MFA_ARN=$(aws --profile ${AWS_PROFILE:-default} --output text iam list-mfa-devices --user-name $(aws --profile ${AWS_PROFILE:-default} --output text iam get-user --query 'User.UserName') --query 'MFADevices[].SerialNumber')
    TOKEN_CODE=$1
    CREDENTIALS=$(aws --profile ${AWS_PROFILE:-default} sts get-session-token --serial-number $MFA_ARN --token-code $TOKEN_CODE --output json| jq -r '.Credentials')
    export AWS_ACCESS_KEY_ID=$(echo $CREDENTIALS | jq -r '.AccessKeyId')
    export AWS_SECRET_ACCESS_KEY=$(echo $CREDENTIALS | jq -r '.SecretAccessKey')
    export AWS_SESSION_TOKEN=$(echo $CREDENTIALS | jq -r '.SessionToken')
}


setProfile() {
  VALID_PROFILES=($(grep -E "^\[.+\]$" ~/.aws/config | sed -e 's!\[!!g' -e 's!profile !!g' -e 's!\]!!g'))
  for ((i = 0; i < ${#VALID_PROFILES[@]}; i++)); do
    if [[ ${VALID_PROFILES[$i]} = $1 ]]; then
        break
    fi
  done
  #if ((i == ${#VALID_PROFILES[@]})); then
    #echo -e "${red}Unknown profile, abort${reset}"
  #else
    export AWS_PROFILE=$1
  #fi
}
getProfiles() {
    grep -E "^\[.+\]$" ~/.aws/config | sed -e 's!\[!!g' -e 's!profile !!g' -e 's!\]!!g'
}
#complete -W "$(getProfiles)" setProfile
#
source ~/code/liquidprompt/liquidprompt
source ~/code/aws-scripts/functions.sh

# Created by `userpath` on 2020-02-06 20:34:02
export PATH="$PATH:/Users/m.tibold/.local/bin"
