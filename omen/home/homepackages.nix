{ lib, config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # pkgs.stable.xxx
    # utils
    neofetch
    htop
    sdcv
    scrcpy
    fd
    ripgrep
    # code
    doom-emacs
    vscode-fhs
    # jetbrains.pycharm-community
    # jetbrains.idea-community
    nixpkgs-fmt
    # common desktop software
    google-chrome
    # firefox
    firefox-esr
    thunderbird
    calibre
    qq
    telegram-desktop
    element-desktop
    spotify
    uxplay
    # libreoffice-qt
    onlyoffice-bin
    obs-studio
    gimp
    # bottles
  ];
}
