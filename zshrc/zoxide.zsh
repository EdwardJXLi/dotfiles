# Enable zoxide if installed
if command -v zoxide >/dev/null 2>&1; then
  # If DISABLE_ZOXIDE_CD is not set, alias cd to zoxide
  if [[ -z "$DISABLE_ZOXIDE_CD" ]]; then
    eval "$(zoxide init --cmd cd zsh)"
  else
    eval "$(zoxide init zsh)"
  fi
fi
