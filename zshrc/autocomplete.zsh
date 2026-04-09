if [[ $EUID -ne 0 ]]; then
  autoload -Uz compinit
  compinit
fi
