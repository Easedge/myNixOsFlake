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
    jetbrains.pycharm-community
    # jetbrains.idea-community
    cmake
    aspell
    aspellDicts.en
    aspellDicts.en-science
    aspellDicts.en-computers
    # common desktop software
    google-chrome
    qbittorrent-qt5
    calibre
    qq
    telegram-desktop
    element-desktop
    spotify
    uxplay
    wpsoffice-cn
    onlyoffice-bin
    obs-studio
    gimp
    # bottles
  ];
}
