if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/abhishek/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#Any files that do not exist on the 
# remote system are copied over
#Any files that exist on both local 
#and remote that have a newer timestamp 
#on the local server are copied over. 
#(Conversely, any files that have an older timestamp are not copied over).

alias rs="rsync -update -raz --progress"
alias gvi="gvim"
alias vi="vim"
alias cm="chmod 777"

# upload to godaddy server
# usage: r2g <source> <destination>
alias r2g="rsync -ravz --rsync-path /home/pratik14/bin/rsync -e ssh" 

#rsync-commit
#run this command to update the website on godaddy
alias rc="rsync -update -raz --progress --rsync-path /home/pratik14/bin/rsync -e ssh ~/git/laravel/ pratik14@rustypages.in:/home/pratik14/"
alias ec2="ssh ubuntu@54.199.253.241"
alias ll="ls -alF --color"
alias la="ls -A --color"
alias l="ls -CF"

# sudo commands
alias ss="sudo su"
alias sup="sudo apt-get update"
alias sug="sudo apt-get upgrade"
alias si="sudo apt-get install"

alias tm="tmux -2"
alias cl="clear"

alias art="php artisan"

autoload -U colors && colors
PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "

source ~/powerline/powerline/bindings/zsh/powerline.zsh

if [ $OSTYPE = "Darwin" ]; then
    OS="mac"
elif [ $OSTYPE = "cygwin" ]; then
    OS="windows"
	alias win="cd /cygdrive/c/Users/9004032456/Documents/"
	export http_proxy='proxy-sen.noc.sony.co.jp:10080'
	export HTTP_proxy='proxy-sen.noc.sony.co.jp:10080'
	export https_proxy='proxy-sen.noc.sony.co.jp:10080'
	export HTTPS_proxy='proxy-sen.noc.sony.co.jp:10080'
elif [ $OSTYPE = "linux-gnu" ]; then
    OS="linux"
else
    OS="unknown"
fi
