# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="fontno"
# Example aliases
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# export PATH=$PATH:/Users/Brian/.rvm/gems/ruby-1.9.3-p392@rails-3.2.13/bin:/Users/Brian/.rvm/gems/ruby-1.9.3-p392@global/bin:/Users/Brian/.rvm/rubies/ruby-1.9.3-p392/bin:/Users/Brian/.rvm/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export EDITOR='mate -w'

rails() {
	if [ -S .zeus.sock ]; then
		zeus "$@"
	else
		command rails "$@" 
	fi
}

rspec() {
	if [ -S .zeus.sock ]; then
		zeus rspec "$@"
	else
		command rspec "$@" 
	fi
}

rake() {
	if [ -S .zeus.sock ]; then
		zeus rake "$@"
	else
		command rake "$@" 
	fi
}

alias migrate="rake db:migrate && rake db:test:prepare"
alias mi="rake db:migrate"
alias bi="bundle install"
alias rc="rails console"
alias rcs="rails console --sandbox"
alias rs="rails server"
alias rgm="rails generate migration"
alias rdm="rails destroy migration"

alias pgstart="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pgstop="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log stop"
