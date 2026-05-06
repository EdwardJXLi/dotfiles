# Nix-specific custom aliases
# NOTE: Requires Nix, NH (https://github.com/nix-community/nh), and lazygit (https://github.com/jesseduffield/lazygit)
if command -v nix >/dev/null 2>&1; then
  function home-edit() {
    (
      cd ~/.config/home-manager &&
      $EDITOR base.nix &&
      $EDITOR extras.nix &&
      $EDITOR desktop.nix &&
      lazygit
    )
  }
  function home-update-llm() {
    (
      cd ~/.config/home-manager &&
      nix flake update llm-agents &&
      lazygit
    )
  }
  function home-update() {
    (
      cd ~/.config/home-manager &&
      nix flake update nixpkgs-unstable &&
      nix flake update nixpkgs-master &&
      nix flake update llm-agents &&
      lazygit
    )
  }
  function home-upgrade() {
    echo "This will update all nix channels. Are you sure you want to continue? (y/n) "
    read
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      (
        cd ~/.config/home-manager &&
        nix flake update &&
        lazygit
      )
    else
      echo "Aborted."
    fi
  }
  function home-switch() {
    if [ "$EUID" -eq 0 ]; then
      nh home switch ~/.config/home-manager -c root
    else
      nh home switch ~/.config/home-manager -c hydra
    fi
  }
  alias home-build=home-switch
  alias home-rebuild=home-switch
  function nix-clean() {
    nh clean all --keep 3 --keep-since 3d
  }
  alias nix-gc=nix-clean
  alias home-clean=nix-clean
  alias home-gc=nix-gc
  function nix-run() {
    local pkg=$1
    local ref=$2
    local -a nixpkgs_arg
    if [ -n "$ref" ]; then
      nixpkgs_arg=(-I "nixpkgs=https://github.com/NixOS/nixpkgs/archive/${ref}.tar.gz")
    fi
    NIXPKGS_ALLOW_UNFREE=1 nix-shell $nixpkgs_arg -p $pkg --run "export P10K_CUSTOM_CONTEXT=\${P10K_CUSTOM_CONTEXT:+\$P10K_CUSTOM_CONTEXT + }${pkg}${ref:+@${ref}}; export SHELL=$SHELL; exec $SHELL"
  }
  function sudo-run() {
    sudo -E $(which $1) "${@:2}"
  }
fi
