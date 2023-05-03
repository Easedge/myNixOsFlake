{ lib, config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    gnome.dconf-editor
    gnome.pomodoro
    gnomeExtensions.appindicator
    gnomeExtensions.tray-icons-reloaded
    gnomeExtensions.vitals
    gnomeExtensions.docker
    gnomeExtensions.systemd-manager
    gnomeExtensions.caffeine
    gnomeExtensions.blur-my-shell
    gnomeExtensions.pano
    gnomeExtensions.desktop-icons-ng-ding
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
