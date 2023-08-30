{ lib, config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # pkgs.stable.xxx
    # utils
    neofetch
    htop
    sdcv
    scrcpy
    # code
    vscode-fhs
    jetbrains.pycharm-community
    jetbrains.idea-community
    nixpkgs-fmt
    # common desktop software
    google-chrome
    firefox
    thunderbird
    qq
    telegram-desktop
    element-desktop
    spotify
    libreoffice-qt
    obs-studio
    gimp
    bottles
    teamviewer
    # rustdesk todesk
  ];
}
