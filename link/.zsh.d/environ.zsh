# Setup editor to use emacs if the server is running
export VISUAL='emacsclient -t --alternate-editor=vim'
export EDITOR='emacsclient -t --alternate-editor=vim'

export SSH_AUTH_SOCK='/Users/kmosher/.ssh-agent.sock'

if [ -f ~/.homebrew_api_token ]; then
   export HOMEBREW_GITHUB_API_TOKEN=$(cat ~/.homebrew_api_token)
fi
