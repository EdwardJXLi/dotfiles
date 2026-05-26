# Enable zoxide if installed (skip for root user, and for AI agent shells
# which spawn fresh shells per command and trigger the zoxide doctor warning).
if command -v zoxide >/dev/null 2>&1 && [[ "$EUID" -ne 0 ]] && [[ -z "$AI_AGENT" ]]; then
  # If DISABLE_ZOXIDE_CD is not set, alias cd to zoxide
  if [[ -z "$DISABLE_ZOXIDE_CD" ]]; then
    eval "$(zoxide init --cmd cd zsh)"
  else
    eval "$(zoxide init zsh)"
  fi
fi
