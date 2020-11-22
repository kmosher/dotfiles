alias salt-i='sudo rsync -a --delete --exclude=.git /home/kmosher/salt/ /srv'
alias salt-c='sudo salt-call --local state.apply'
alias salt-cd='sudo salt-call --local state.apply -l debug'
