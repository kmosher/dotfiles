# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

alias grep='grep --color=auto'

# Super user
alias _='sudo'
alias please='sudo'
alias fucking='sudo'

#alias g='grep -in'

# Show history
alias history='fc -l 1'

#alias afind='ack-grep -il'

alias ec='emacsclient --alternate-editor='\'''\'' -t'
alias emc='emacsclient -n'
ecsu() {
#    echo emacsclient --alternate-editor='' -t sudo://${^*:a}
    emacsclient --alternate-editor='' -t /sudo::${^*:a}
}

alias pbers='puppet-bundle exec rake spec'

alias ag='ag --path-to-ignore=~/.agignore'

alias gphpr='git push origin HEAD; hub pull-request -o'

ta() {
    tmux attach -t ${*:-0}
}
if [ -x ~/.local/bin/agenttmux ]; then
   alias tmux='~/.local/bin/agenttmux'
fi

compdef wwpd=ssh
