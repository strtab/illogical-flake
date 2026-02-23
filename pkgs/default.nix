{ pkgs }:

{
  gruvbox-plus-icons = pkgs.callPackage ./gruvbox-plus-icons.nix { };
  material-symbols = pkgs.callPackage ./material-symbols { };
}
