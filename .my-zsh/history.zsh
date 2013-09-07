## Command history configuration
if [ -z $HISTFILE ]; then
    HISTFILE=$HOME/.zsh_history
fi
# History settings
HISTSIZE=10000
SAVEHIST=10000

# Double check the results of bang substitutions
setopt histverify

# History appends to current file (on by default)
setopt append_history
# Share history among all shells.
setopt sharehistory
# Enable more detailed history format
setopt extendedhistory
# ignore repeated dupes
setopt histignoredups 
# purge dupes first
setopt histexpiredupsfirst
# only show once when searching
setopt histfindnodups 
# clean up blanks
setopt histreduceblanks
