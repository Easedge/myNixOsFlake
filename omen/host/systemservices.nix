{ config, pkgs, ... }:

{
  services.xserver.xkb.layout = "cn";
  services.xserver.excludePackages = [ pkgs.xterm ];
  services.xserver.libinput.enable = true;
  # services.xserver.libinput.touchpad = {
  #   horizontalScrolling = true;
  #   naturalScrolling = true;
  #   tapping = true;
  #   tappingDragLock = false;
  # };
  services.printing.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    # pkgs.xdg-desktop-portal-gtk
    # pkgs.libsForQt5.xdg-desktop-portal-kde
  ];
  xdg.portal.xdgOpenUsePortal = true;

  services.udev.packages = with pkgs; [
    # gnome.gnome-settings-daemon
    android-udev-rules
  ];

  sound.enable = true;

  security.polkit.enable = true;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    publish = {
      enable = true;
      addresses = true;
      workstation = true;
      userServices = true;
    };
  };

  services.fwupd.enable = true;
  services.openssh.enable = true;
  services.flatpak.enable = true;
  services.v2raya.enable = true;
  services.guix.enable = true;
}
