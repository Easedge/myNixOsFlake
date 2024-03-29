{ lib, config, pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
    extraConfig = ''
    '';
    extraPackages = [
      pkgs.emacsPackages.vterm
    ];
  };

  services.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
  };

}
