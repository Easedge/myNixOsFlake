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

  environment.gnome.excludePackages = with pkgs; [
    gnome-photos
    gnome.yelp
    gnome.geary
    gnome.totem
    gnome.cheese
    gnome.epiphany
    gnome.gnome-contacts
    gnome.gnome-music
    gnome.gnome-maps
    gnome.gnome-initial-setup
  ];

  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };
}
