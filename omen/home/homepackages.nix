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
    fish
    # code
    vscode-fhs
    # jetbrains.pycharm-community
    # jetbrains.idea-community
    nixpkgs-fmt
    cmake
    libtool
    ccls
    jdt-language-server
    gopls
    rust-analyzer
    # common desktop software
    google-chrome
    # firefox
    # firefox-esr
    thunderbird
    qbittorrent-qt5
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
