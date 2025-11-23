# Functions

## kube-ps1 like prompt ##########################################

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

## https://www.reddit.com/r/MacOS/comments/zq36l1/whats_up_with_mdfind_warning_on_console/
function mdfind() {
    /usr/bin/mdfind $@ 2> >(grep --invert-match ' \[UserQueryParser\] ' >&2)
}

## ripgrep->fzf->vim [QUERY]
## https://junegunn.github.io/fzf/tips/ripgrep-integration/
function rfv() {
  RELOAD='reload:rg --column --color=always --smart-case {q} || :'
  OPENER='if [[ $FZF_SELECT_COUNT -eq 0 ]]; then
            vim {1} +{2}     # No selection. Open the current line in Vim.
          else
            vim +cw -q {+f}  # Build quickfix list for the selected items.
          fi'
  fzf --disabled --ansi --multi \
      --bind "start:$RELOAD" --bind "change:$RELOAD" \
      --bind "enter:become:$OPENER" \
      --bind "ctrl-o:execute:$OPENER" \
      --bind 'alt-a:select-all,alt-d:deselect-all,ctrl-/:toggle-preview' \
      --delimiter : \
      --preview 'bat --style=full --color=always --highlight-line {2} {1}' \
      --preview-window '~4,+{2}+4/3,<80(up)' \
      --query "$*"
}
