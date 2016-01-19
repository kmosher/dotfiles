# /etc/zsh/zlogin: system-wide .zlogin file for zsh(1).
#
# This file is sourced only for login shells. It
# should contain commands that should be executed only
# in login shells. It should be used to set the terminal
# type and run a series of external commands (fortune,
# msgs, from, etc.)
#
# Global Order: zshenv, zprofile, zshrc, zlogin
#
# Modified from .zprezto/runcoms
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Execute code that does not affect the current session in the background.
{
  # Compile the completion dump to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!
