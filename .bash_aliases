# python virtuals
alias p2='source ~/projects/python_envs/p2/bin/activate'
alias p3='source ~/projects/python_envs/p3/bin/activate'
alias ffdm='source ~/Development/Python/envs/ffdm/bin/activate'
alias dyno='source ~/projects/dyno/virtual/bin/activate'
alias p2django='source ~/Development/Python/envs/p2django/bin/activate'
alias p3django='source ~/Development/Python/envs/p3django/bin/activate'
alias vim='/usr/local/bin/nvim'
alias oldvim='/usr/bin/vim'
alias v='vim'
# clear shortcut
alias cl=clear

# dotfiles
alias dots="cd ~/projects/dotfiles && ls -a"
# source https://stackoverflow.com/a/34432985/2377489
type nvim >/dev/null 2>&1 && alias vim="$(which nvim)"

alias cd..="cd .."
alias gp="java -jar /home/qup/projects/fi/crocs/GlobalPlatformPro/gp.jar"
alias sc="java -jar /home/qup/bin/apdu4j.jar"
source ~/projects/dotfiles/.bash_aliases.custom

alias th="cd ~/projects/fi/thesis"
alias tt="cd ~/projects/fi/thesis-text"
alias rec=record
alias tmux='direnv exec / tmux'

# Pipenv aliases
alias pes="pipenv shell"
alias prp="pipenv run"
