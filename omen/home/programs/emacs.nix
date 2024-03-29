{ lib, config, pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
    extraConfig = ''
    '';
    extraPackages = epkgs: [
      epkgs.vterm
    ];
  };

  services.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
  };

}
