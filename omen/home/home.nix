{ inputs, outputs, lib, config, pkgs, ... }:

{
  imports = [
    ./homepackages.nix
  ];

  home.stateVersion = "23.05";
}
