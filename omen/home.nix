{ inputs, outputs, lib, config, pkgs, ... }:

{
  imports = [
    ./homepackages.nix
  ];

  home = {
    username = "junglefish";
    homeDirectory = "/home/junglefish";
  };

  programs.home-manager.enable = true;

  home.stateVersion = "23.05";
}
