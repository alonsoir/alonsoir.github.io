export ZSH="/Users/aironman/.oh-my-zsh"
export PATH="$HOME/.sdkman/bin:$PATH"
export LC_ALL=es_ES.UTF-8 man
# en_US.UTF-8
# Use random theme
ZSH_THEME="spaceship"
autoload -U promptinit; promptinit
export UPDATE_ZSH_DAYS=1

# Enable autocorrection
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  docker
  osx
  colored-man-pages
  colorize
  common-aliases
  copyfile
)

eval $(thefuck --alias)
source "$HOME/.sdkman/bin/sdkman-init.sh"
source $HOME/.oh-my-git/prompt.sh
source "$HOME/.antigen/antigen.zsh"
source $ZSH/oh-my-zsh.sh

# source ~/.zshrc
antigen init ~/.antigenrc

# antigen use oh-my-zsh
# antigen bundle arialdomartini/oh-my-git
# antigen theme arialdomartini/oh-my-git-themes arialdo-granzestyle
# antigen apply

# This function is to show what alias i am running.
# https://stackoverflow.com/questions/9299402/echo-all-aliases-in-zsh
_-accept-line () {
    emulate -L zsh
    local -a WORDS
    WORDS=( ${(z)BUFFER} )
    # Unfortunately ${${(z)BUFFER}[1]} works only for at least two words,
    # thus I had to use additional variable WORDS here.
    local -r FIRSTWORD=${WORDS[1]}
    local -r GREEN=$'\e[32m' RESET_COLORS=$'\e[0m'
    [[ "$(whence -w $FIRSTWORD 2>/dev/null)" == "${FIRSTWORD}: alias" ]] &&
        echo -nE $'\n'"${GREEN}Executing $(whence $FIRSTWORD)${RESET_COLORS}"
    zle .accept-line
}
zle -N accept-line _-accept-line




# My useful aliases
# alias jira="cd ~/Documents/project/gitjira-cli"
# alias prlist='go run *.go pr -s "2019-10-01" -o -c > ~/Documents/project/pr.txt'
# alias c="clear"
alias gp="cd /Users/aironman/gitProjects"
alias q="exit"
alias zsh="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias vimrc='vim ~/.vimrc'
alias szsh="source ~/.zshrc"
# alias p="cd ~/document/project/Personal\ Projects"
# alias berm="bundle exec rake db:migrate"
# alias bec="bundle exec rails c"
# alias bes="bundle exec rails s"
# alias bel="bin/elasticsearch"
# alias fluxx="cd ~/Documents/project/Partner/fluxx_flmtg"
# alias es="cd ~/Documents/project/elasticsearch-7.5.0 && bel"
# alias dyn="DYNAMIC_SCHEDULE=true bundle exec rake resque:scheduler"
# alias que="QUEUE=* bundle exec rake resque:work"
# alias regex="perldoc perlreref"
# local ret_status="%(?:%{$fg[yellow]%}=> :%{$fg[red]%}=> %s)"

bindkey -v
# npm global
# export PATH=~/.npm-global/bin:$PATH

# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
# export PATH="/usr/local/opt/ruby/bin:$PATH"

# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
# export PATH="/usr/local/opt/libxml2/bin:$PATH"
# export PATH="/usr/local/opt/v8@3.15/bin:$PATH"

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



# Set bigfade ZSH as a prompt
autoload -U promptinit; promptinit
prompt bigfade

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship
