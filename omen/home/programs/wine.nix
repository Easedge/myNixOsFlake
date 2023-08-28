{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # pkgs.stable.xxx
    # support both 32- and 64-bit applications
    # wineWowPackages.stable

    # wine-staging (version with experimental features)
    wineWowPackages.staging

    # winetricks (all versions)
    winetricks

    # native wayland support (unstable)
    wineWowPackages.waylandFull
  ];
}
