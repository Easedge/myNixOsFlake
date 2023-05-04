{ lib, config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnome.pomodoro
    gnomeExtensions.vitals
    gnomeExtensions.caffeine
    gnomeExtensions.blur-my-shell
    gnomeExtensions.pano
    gnomeExtensions.tiling-assistant
  ];

  environment.gnome.excludePackages = with pkgs.gnome; [
    epiphany
    gnome-contacts
    gnome-maps
    geary
  ];

  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };
}
