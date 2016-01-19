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

# Allows cd var if $var is a dir. Turns out to be annoying though, since it
# allows lack of leading  ~. This is pretty annoying when you have a
# a billion user dirs named after your tools
# setopt cdablevars

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
