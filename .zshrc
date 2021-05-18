export ZSH="/Users/aironman/.oh-my-zsh"
export PATH="$HOME/.sdkman/bin:$PATH"
export LC_ALL=en_US.UTF-8
# Use random theme
ZSH_THEME="random"
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

antigen use oh-my-zsh
antigen bundle arialdomartini/oh-my-git
antigen theme arialdomartini/oh-my-git-themes oppa-lana-style
antigen apply






# My useful aliases
# alias jira="cd ~/Documents/project/gitjira-cli"
# alias prlist='go run *.go pr -s "2019-10-01" -o -c > ~/Documents/project/pr.txt'
# alias c="clear"
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
