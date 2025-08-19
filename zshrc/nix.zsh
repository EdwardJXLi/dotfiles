# Nix-specific custom aliases
if command -v nix >/dev/null 2>&1; then
  # alias hydra-edit='(cd /etc/nixos/ && sudo $EDITOR configuration.nix; sudo $EDITOR flake.nix; sudo $EDITOR user-packages.nix; sudo lazygit)'
  # alias hydra-rebuild='(cd /etc/nixos && sudo nixos-rebuild switch  $@ --show-trace --impure --flake .#main)'
  # alias hydra-upgrade='(cd /etc/nixos && sudo nix-channel --update && sudo nixos-rebuild switch $@ --upgrade --impure --flake .#main)'
  function home-edit() {
    (
      cd ~/.config/home-manager &&
      $EDITOR base.nix &&
      $EDITOR extras.nix &&
      $EDITOR desktop.nix &&
      lazygit
    )
  }
  function home-update() {
    nix-channel --update unstable
  }
  function home-upgrade() {
    nix-channel --update
  }
  function home-switch() {
    home-manager switch --show-trace -f ~/home.nix
  }
  alias home-build=home-switch
  alias home-rebuild=home-switch
  function nix-clean() {
    nix-store --gc
  }
  function nix-run() {
    NIXPKGS_ALLOW_UNFREE=1 nix-shell -p $1 --run "export P10K_CUSTOM_CONTEXT=\${P10K_CUSTOM_CONTEXT:+\$P10K_CUSTOM_CONTEXT + }$1; export SHELL=$SHELL; exec $SHELL"
  }
  function sudo-run() {
    sudo $(which $1) "${@:2}"
  }
fi
