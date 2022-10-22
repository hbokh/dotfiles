#alias brall='brew -v update && brew upgrade && brew cleanup -s && rm -rf "$(brew --cache)"'
alias brall='brew -v update && brew upgrade && brew cleanup -s && /bin/rm -rf ~/Library/Caches/Homebrew/*'
alias dmesg='sudo dmesg'
alias v='lsd -altrF'
alias cat='bat'

# Docker
alias d='docker'
alias dip='docker inspect --format '\''{{ .NetworkSettings.IPAddress }}'\'''
alias dl='docker ps -l -q'
alias doco='docker-compose'
alias dockerclean='dockercleanc || true && dockercleani'
alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'
alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'
alias dockerkillall='docker kill $(docker ps -q)'
alias dhub="browse https://hub.docker.com"

alias vm='ssh vagrant@127.0.0.1 -p 2222'
alias vssh='vagrant ssh'
alias kitchen='bundle exec kitchen'

# Suffix aliases
alias -s {yml,json,md}=code
alias browse="open -a /Applications/Firefox.app"

# Kubernetes related
alias k='kubectl'
alias argocd='argocd --grpc-web'

# History
case ${HIST_STAMPS-} in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac
