# Prepend to $PATH
export GOPATH="$HOME/golang"
path[1,0]=($HOME/.local/bin $HOME/bin $GOPATH/bin /opt/puppet-omnibus/embedded/bin)
export PATH
# These break sensu, and other rubby crap
# export GEM_HOME=vendor/gem
# export GEM_PATH="$GEM_HOME:/opt/puppet-omnibus/embedded/lib/ruby/gems/2.1.0:$GEM_PATH"
