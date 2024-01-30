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
    vscode-fhs
    # jetbrains.pycharm-community
    # jetbrains.idea-community
    nixpkgs-fmt
    ccls
    jdt-language-server
    gopls
    rust-analyzer
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
