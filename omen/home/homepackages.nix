{ lib, config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # pkgs.stable.xxx
    nixpkgs-fmt
    htop
    sdcv
    vscode-fhs
    google-chrome
    firefox
    thunderbird
    telegram-desktop
    spotify
    scrcpy
    # teamviewer rustdesk todesk
  ];
}
