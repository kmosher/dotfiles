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

alias ghpr='git push origin HEAD; gh pr create --web'

alias gitdel='git checkout -q master && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base master $branch) && [[ $(git cherry master $(git commit-tree $(git rev-parse "$branch^{tree}") -p $mergeBase -m _)) == "-"* ]] && echo "$branch is merged into master and can be deleted"; done'

alias gitdelgo='git checkout -q master && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base master $branch) && [[ $(git cherry master $(git commit-tree $(git rev-parse "$branch^{tree}") -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'

aws-ex() {
    env | grep AWS | sed -e 's/^/export /' | tee ~/.aws-session-creds
}

aws-env() {
    eval $(aws-sso-creds export -p "$1")
    aws-ex
}

aws-up() {
    aws sso login --profile "$1" && eval $(aws-sso-creds export -p "$1")
    aws-ex
}

aws-imp() {
    source ~/.aws-session-creds
}

ta() {
    tmux attach -t ${*:-0}
}
if [ -x ~/.local/bin/agenttmux ]; then
   alias tmux='~/.local/bin/agenttmux'
fi

compdef wwpd=ssh
