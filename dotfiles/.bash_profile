#
# ~/.bash_profile
#

if [[ -f ~/.usezsh ]]; then
  export SHELL=$(which zsh)
  exec $SHELL -l
else
  [[ -f ~/.bashrc ]] && . ~/.bashrc
fi
