# Functions

# kube-ps1 like prompt ##########################################

function kube-toggle() {
  if (( ${+POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND} )); then
    unset POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND
  else
    POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND='kubectl|helm|kubens|kubectx|oc|istioctl|kogito|k9s|helmfile'
  fi
  p10k reload
  if zle; then
    zle push-input
    zle accept-line
  fi
}

zle -N kube-toggle
bindkey '^]' kube-toggle  # ctrl-] to toggle kubecontext in powerlevel10k prompt

## launchctl reload ###########################################################
function lctl {
    COMMAND=$1
    PLIST_FILE=$2
    if [ "$COMMAND" = "reload" ] && [ -n "$PLIST_FILE" ]
      then
        echo "reloading ${PLIST_FILE}.."
        launchctl unload ${PLIST_FILE}
        launchctl load ${PLIST_FILE}
      else
        echo "either command not specified or plist file is not defined"
    fi
}

# https://www.reddit.com/r/MacOS/comments/zq36l1/whats_up_with_mdfind_warning_on_console/
function mdfind() {
    /usr/bin/mdfind $@ 2> >(grep --invert-match ' \[UserQueryParser\] ' >&2)
}
