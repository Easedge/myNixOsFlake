{ lib, config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.defaultSession = "plasmawayland";

  environment.systemPackages = with pkgs; [
    layan-kde
    clinfo
    mesa-demos
    vulkan-tools
    wayland-utils
  ] ++ (with libsForQt5; [
    discover
    kate
    kcalc
    dragon
    kirigami-addons
    kio-extras
  ]);

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    khelpcenter
  ];

  programs.kdeconnect = {
    enable = true;
    package = pkgs.plasma5Packages.kdeconnect-kde;
  };

  programs.dconf.enable = true;
  programs.partition-manager.enable = true;

  services.colord.enable = true;
  services.geoclue2.enable = true;
}
