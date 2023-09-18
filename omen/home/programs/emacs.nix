{ config, pkgs, ... }:
{
  # nixpkgs.overlays = [
  #   (import (builtins.fetchTarball {
  #     url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
  #   }))
  # ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
    # package = pkgs.emacs-unstable;
    extraConfig = ''
    '';
    # extraPackages = [];
  };

  services.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
    # package = pkgs.emacs-unstable;
  };

}
