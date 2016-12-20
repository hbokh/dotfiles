#############################################################
# Generic configuration that applies to all shells
#############################################################

source ~/.shellvars
source ~/.shellfn
source ~/.shellpaths
source ~/.shellaliases
source ~/.iterm2_shell_integration.`basename $SHELL`
# Private/Proprietary shell aliases (not to be checked into the public repo) :)
#source ~/Dropbox/Private/Boxes/osx/.shellaliases
# Aliases:
alias v='gls -altrF --color'
alias mp='mplayer -fs -cache 8192'
alias dmesg='sudo dmesg'
alias vssh='vagrant ssh'
alias brall='brew -v update && brew upgrade && brew cleanup && brew prune && rm -rf ~/Library/Caches/Homebrew/*'

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;37;41'

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/MacGPG2/bin
export PATH=$HOME/bin:$PATH

export HISTSIZE=5000
export HISTFILESIZE=5000

export CLICOLOR=1
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

export TERM=xterm-256color

# SSH Keychain setup ##################################################
#/usr/local/bin/keychain --noask ~/.ssh/identity ~/.ssh/id_dsa ~/.ssh/id_rsa
/usr/local/bin/keychain ~/.ssh/id_rsa_legacy ~/.ssh/id_dsa ~/.ssh/id_ed25519 ~/.ssh/id_rsa
# Only use RSA:
#/usr/local/bin/keychain ~/.ssh/id_rsa
source ~/.keychain/`hostname`-sh

# Fany prompt #########################################################
# Created by icetrey <trey@imagin.net>
# Added by Spidey 08/06
# further messed up by tigert
#
GRAD1=`tty|cut -d/ -f3-4`
COLOR1="\[\033[0;39m\]"
COLOR2="\[\033[1;36m\]"
COLOR3="\[\033[1;30m\]"
COLOR4="\[\033[0m\]"
#COLOR5="\[\033[1;39m\]"

PS1="$COLOR3$COLOR1$COLOR2--($COLOR1\u$COLOR3@$COLOR1\h$COLOR2)$COLOR2-($COLOR1\#$COLOR3|$COLOR1$GRAD1$COLOR2)-$COLOR2($COLOR1\$(date +%H:%M)$COLOR3|$COLOR1\$(date +%m/%d/%Y)$COLOR2)--$COLOR1$COLOR3$COLOR4\n$COLOR3$COLOR1$COLOR2($COLOR1\$$COLOR3:$COLOR1\w$COLOR2)$COLOR1$COLOR2->$COLOR4 " 

PS2="$COLOR2$COLOR1$COLOR3-$COLOR4 "
#######################################

# oh-my-git ###########################################################
source /Users/hbokh/.oh-my-git/prompt.sh

#bind "set completion-ignore-case on"

# Ruby RVM
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
#rvm system

# Vagrant #############################################################
alias vm='ssh vagrant@127.0.0.1 -p 2222'
# Bash completion, not in Brew-completion
# URL: https://github.com/rjw1/vagrant-bash-completion
source /usr/local/etc/bash_completion.d/vagrant

# Homebrew ############################################################
export HOMEBREW_GITHUB_API_TOKEN=23576f24df8ce6e8cdfef70f804bbea945070d8a
export HOMEBREW_TEMP="/usr/local/tmp"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Ansible #############################################################
export ANSIBLE_NOCOWS=1

# Docker ##############################################################
alias d='docker'
alias dl='docker ps -l -q'
# Kill all running containers.
alias dockerkillall='docker kill $(docker ps -q)'
# Delete all stopped containers.
alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'
# Delete all untagged images.
alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'
# Delete all stopped containers and untagged images.
alias dockerclean='dockercleanc || true && dockercleani'
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# docker-machine (previously boot2docker) #############################
#export DOCKER_TLS_VERIFY="1"
#export DOCKER_HOST="tcp://192.168.99.100:2376"
#export DOCKER_CERT_PATH="/Users/hbokh/.docker/machine/machines/dev"
#export DOCKER_MACHINE_NAME="dev"
# Run this command to configure your shell:
# eval "$(docker-machine env dev)"

#b2dforwardport() {
#VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port$1,tcp,,$1,,$1";
#VBoxManage modifyvm "boot2docker-vm" --natpf1 "udp-port$1,udp,,$1,,$1";
#}

# Go ##################################################################
export GOROOT=/usr/local/Cellar/go/1.7.3/libexec
export PATH=$PATH:$GOROOT/bin
export GOPATH=~/develop/gocode

# Virtual envs ########################################################
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# CoreOS ##############################################################
#export FLEETCTL_TUNNEL=192.168.178.141

# Fix perms screwed by Sophos #########################################
#sudo chown -R hbokh:admin /usr/local/bin /usr/local/share

# Sensible Bash #######################################################
#if [ -f ~/bin/sensible.bash ]; then
#     source ~/bin/sensible.bash
#fi

# m-cli ###############################################################
export PATH=$PATH:/usr/local/m-cli

source ~/.iterm2_shell_integration.bash

# debops ##############################################################
export PYTHONPATH="/usr/local/lib/python2.7/site-packages"
export PYTHONPATH="/usr/local/Cellar/ansible/2.2.0.0/libexec/lib/python2.7/site-packages:/usr/local/Cellar/ansible/2.2.0.0/libexec/vendor/lib/python2.7/site-packages:$PYTHONPATH"
