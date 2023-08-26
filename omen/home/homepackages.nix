{ lib, config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # pkgs.stable.xxx
    nixpkgs-fmt
    neofetch
    htop
    sdcv
    vscode-fhs
    google-chrome
    firefox
    thunderbird
    telegram-desktop
    spotify
    scrcpy
    qq
    lutris
    libreoffice-qt
    obs-studio
    gimp
    # teamviewer rustdesk todesk
  ];
}
