# Enable zoxide if installed
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
  # If DISABLE_ZOXIDE_CD is not set, alias cd to zoxide
  if [[ -z "$DISABLE_ZOXIDE_CD" ]]; then
    alias cd='z'
  fi
fi
