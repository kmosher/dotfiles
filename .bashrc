# Pretty colors
export TERM=xterm-256color
# for tmux: export 256color
[ -n "$TMUX" ] && export TERM=screen-256color

# This makes less -R work properly with the diffinator
export PYTHONIOENCODING=utf-8

# Avoid succesive duplicates in the bash command history.
export HISTCONTROL=ignoreboth
export HISTSIZE=2000
export HISTFILESIZE=10000

# Append commands to the bash command history file (~/.bash_history)
# instead of overwriting it.
shopt -s histappend
shopt -s histverify
shopt -s histreedit

# Append commands to the history every time a prompt is shown,
# instead of after closing the session.
PROMPT_COMMAND='history -a'
alias uh='history -n'

# Java gets grumpy if you don't set it.
export _JAVA_OPTIONS=-Xmx2g
#alias java="ulimit -v 100000000000; java"

#############
#  ALIASES  #
#############
alias ipad='agenttmux attach -t ipad'
# Make grep more user friendly by highlighting matches
# and exclude grepping through .git folders.
alias grep='grep --color=auto --exclude-dir=\.git --exclude-dir=.svn'
alias ff='find -print0 | xargs -0 grep --color=always'

#alias dropoff

_scj() {
    if [ -z $2 ]; then
        COMPREPLY=($(find -L $HOME/pg/search_cluster -type f -printf "%P\n"))
    else
        COMPREPLY=($(find -L $HOME/pg/search_cluster -type f -name "$2*" -printf "%P\n"))
    fi
} &&
complete -F _scj scj

# One editor to rule them all
# Connects to emacs if it's running. Otherwise starts it
alias ec="emacsclient --alternate-editor='' -t "
alias emc="emacsclient -n"
export EDITOR="emacsclient --alternate-editor='' -t"
export VISUAL="emacsclient --alternate-editor='' -t"
export SVN_EDITOR="emacsclient --alternate-editor='' -t"

if [ -n "$INSIDE_EMACS" ]; then
    alias ec="emacsclient"
    EDITOR="emacsclient"
    VISUAL="emacsclient"
    SVN_EDITOR="emacsclient"
fi

__git_ps1_yelp ()
{
    local g="$(git rev-parse --git-dir 2>/dev/null)"
    if [ -n "$g" ]; then
        local r
        local b

        if [ -d "$g/../.dotest" ]; then
            r="|AM/REBASE"
            b="$(git symbolic-ref HEAD 2>/dev/null)"
        elif [ -f "$g/.dotest-merge/interactive" ]; then
            r="|REBASE-i"
            b="$(cat $g/.dotest-merge/head-name)"
        elif [ -d "$g/.dotest-merge" ]; then
            r="|REBASE-m"
            b="$(cat $g/.dotest-merge/head-name)"
        elif [ -f "$g/MERGE_HEAD" ]; then
            r="|MERGING"
            b="$(git symbolic-ref HEAD 2>/dev/null)"
        elif [ -f "$g/rebase-merge/interactive" ]; then
            r="|REBASE-i"
            b="$(cat "$g/rebase-merge/head-name")"
        elif [ -d "$g/rebase-merge" ]; then
            r="|REBASE-m"
            b="$(cat "$g/rebase-merge/head-name")"
        else
            if [ -d "$g/rebase-apply" ]; then
                if [ -f "$g/rebase-apply/rebasing" ]; then
                    r="|REBASE"
                elif [ -f "$g/rebase-apply/applying" ]; then
                    r="|AM"
                else
                    r="|AM/REBASE"
                fi
            elif [ -f "$g/MERGE_HEAD" ]; then
                r="|MERGING"
            elif [ -f "$g/BISECT_LOG" ]; then
                r="|BISECTING"
            fi
            b="$(git symbolic-ref HEAD 2>/dev/null)" || {

                b="$(case "${GIT_PS1_DESCRIBE_STYLE-}" in
                    (contains)
                        git describe --contains HEAD ;;
                    (branch)
                        git describe --contains --all HEAD ;;
                    (describe)
                        git describe HEAD ;;
                    (* | default)
                        git describe --exact-match HEAD ;;
                    esac 2>/dev/null)" ||
                b="$(cut -c1-7 "$g/HEAD" 2>/dev/null)..." ||
                b="unknown"
                b="($b)"
            }
        fi
        local w
        local i
        local s
        local u
        local c

        if [ "true" = "$(git rev-parse --is-inside-git-dir 2>/dev/null)" ]; then
            if [ "true" = "$(git rev-parse --is-bare-repository 2>/dev/null)" ]; then
                c="BARE:"
            else
                b="GIT_DIR!"
            fi
        elif [ "true" = "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]; then
            if [ -n "${GIT_PS1_SHOWDIRTYSTATE-}" ]; then
                if [ "$(git config --bool bash.showDirtyState)" != "false" ]; then
                    git diff --no-ext-diff --ignore-submodules \
                        --quiet --exit-code || w="*"
                    if git rev-parse --quiet --verify HEAD >/dev/null; then
                        git diff-index --cached --quiet \
                            --ignore-submodules HEAD -- || i="+"
                    else
                        i="#"
                    fi
                fi
            fi
            if [ -n "${GIT_PS1_SHOWSTASHSTATE-}" ]; then
                git rev-parse --verify refs/stash >/dev/null 2>&1 && s="$"
            fi

            if [ -n "${GIT_PS1_SHOWUNTRACKEDFILES-}" ]; then
                if [ -n "$(git ls-files --others --exclude-standard)" ]; then
                    u="%"
                fi
            fi
        fi

        if [ -n "${1-}" ]; then
            printf "$1" "$c${b##refs/heads/}$w$i$s$u$r"
        else
            printf " (%s)" "$c${b##refs/heads/}$w$i$s$u$r"
        fi
    fi
}

__git_colorize_ps1_yelp()
{
    local BRIGHT=1
    local DIM=0

    local FOREGROUND=3
    local BACKGROUND=4

    #     DIM        BRIGHT
    local BLACK=0  # Dark Gray
    local RED=1    # Light Red
    local GREEN=2  # Light Green
    local BROWN=3  # Yellow
    local BLUE=4   # Light Blue
    local PURPLE=5 # Light Purple
    local CYAN=6   # Light Cyan
    local GRAY=7   # White

    local branch=$(git-branch-name 2>/dev/null)
    local remote_url

    # Determine the remote repo for the given branch
    if [ -n "${branch}" ] && local remote_name=$(git config --get "branch.${branch}.remote"); then
        remote_url=$(git config --get "remote.${remote_name}.url")
    else
        remote_url=$(git config --get "remote.origin.url")
    fi
    # Red for master
    if [[ "${branch}" == "master" ]]; then
        if [ "${remote_url}" = "git.yelpcorp.com:yelp-main" ]; then
            printf "\e[${BRIGHT};${BACKGROUND}${RED}m"
        else
            printf "\e[${BRIGHT};${FOREGROUND}${RED}m"
        fi
    # Gray for the default branch made by dev-clone
    elif [[ "${branch}" == "gone_fishin" && "${remote_name}" == "canon" ]]; then
        printf "\e[${DIM};${FOREGROUND}${GRAY}m"
    # Green if you're pointed at your own public repo
    elif [[ "${remote_url}" == "git.yelpcorp.com:devs/${USER}" ]]; then
        printf "\e[${BRIGHT};${FOREGROUND}${GREEN}m"
    # Purple if you're pointed to someone else's repo (I'd put yellow, but it conflicts with the path name)
    elif [[ "${remote_url}" == git.yelpcorp.com:devs/* ]]; then
        printf "\e[${DIM};${FOREGROUND}${PURPLE}m"
    else
        printf "\e[${BRIGHT};${FOREGROUND}${CYAN}m"
    fi
}

# My own PS1, I changed the hostname to purple instead of green so it doesn't conflict with the branchname
PS1='\[\e[1;34m\]\u\[\e[0;39m\]@\[\e[1;35m\]\h\[\e[0;39m\]:\[\e[1;33m\]\w\[\e[0;39m\]$(__git_ps1_yelp " \[$(__git_colorize_ps1_yelp)\](%s)")\[\e[0;39m\]\$ '

# The standard PS1 with green hostname for those who fear change
#PS1='\[\e[1;34m\]\u\[\e[0;39m\]@\[\e[1;32m\]\h\[\e[0;39m\]:\[\e[1;33m\]\w\[\e[0;39m\]$(__git_ps1_yelp " \[$(__git_colorize_ps1_yelp)\](%s)")\[\e[0;39m\]\$ '

# Sandbox indicator
if [ "$YELP_IN_SANDBOX" ]; then
    export PS1="$PS1(sandbox)\$ "
fi

if [ "$TMUX" ]; then
# Sets the tmux title to the currently running command or the PWD
#export PS1="\[\ek${USER/#kmosher/k}@${HOSTNAME/#dev/d}:${PWD/#$HOME/~}\e\\]${PS1}"
    export PS1="\[\ek\w\e\\]${PS1}"
    trap 'echo -ne "\ek${BASH_COMMAND:0:17}"; if [ ${#BASH_COMMAND} -gt 20 ]; then echo -n "..."; else echo -n "${BASH_COMMAND:17:20}"; fi; echo -ne "\e\\"' DEBUG
fi
