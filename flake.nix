{
  description = "Illogical Impulse - Home-manager module for end-4's Hyprland dotfiles with QuickShell";

  inputs = {
    # These will be overridden by the user's flake
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell?ref=refs/heads/master&rev=191085a8821b35680bba16ce5411fc9dbe912237";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Default dotfiles - can be overridden by users
    dotfiles = {
      url = "github:end-4/dots-hyprland?ref=refs/heads/main&rev=1b4c439c3e8286809747becfc59461b484345bfa&submodules=1";
      flake = false;
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      quickshell,
      nur,
      dotfiles,
      ...
    }:
    let
      flakeInputs = { inherit quickshell nur dotfiles; };
    in
    {
      # Home-manager module for user configuration
      homeManagerModules.default =
        {
          config,
          lib,
          pkgs,
          ...
        }:
        (import ./home-module.nix) {
          inherit config lib pkgs;
          inputs = flakeInputs;
        };
      homeManagerModules.illogical-flake = self.homeManagerModules.default;
    };
}
