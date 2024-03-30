{ lib, config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    emacsPackages.vterm
    emacsPackages.mu4e
  ];


  services.emacs = {
    enable = true;
    install = true;
    package = pkgs.emacs-gtk;
  };

  environment.pathsToLink = [
    "/share/emacs/site-lisp/mu4e"
  ];

}
