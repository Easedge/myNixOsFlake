{ lib, config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnome.pomodoro
    gnomeExtensions.pano
    gnomeExtensions.vitals
    gnomeExtensions.caffeine
    gnomeExtensions.blur-my-shell
    gnomeExtensions.tiling-assistant
  ];

  environment.gnome.excludePackages = with pkgs.gnome; [
    yelp
    geary
    totem
    cheese
    epiphany
    gnome-contacts
    gnome-music
    gnome-maps
    gnome-initial-setup
  ];

  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };
}
