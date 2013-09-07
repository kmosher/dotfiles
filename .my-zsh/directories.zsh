# Changing/making/removing directory
# TODO: Investigate more
#setopt auto_name_dirs
# CD uses the dirstack
setopt auto_pushd
# Don't push dir multiply
setopt pushd_ignore_dups
# Reverse - and + in pushd. Needs investigation
# setopt pushdminus

# Allows you to go to directories without cd
setopt autocd
# Allos cd var if $var is a dir
setopt cdablevars

# Typo guards
alias ..='cd ..'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd/='cd /'

# Shortcuts
alias md='mkdir -p'
alias rd=rmdir
alias d='dirs -v | head -10'
