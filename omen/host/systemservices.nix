{ config, pkgs, ...}:

{
  services.xserver.layout = "cn";
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
    pkgs.xdg-desktop-portal
  ];
  xdg.portal.xdgOpenUsePortal = true;

  services.udev.packages = with pkgs; [
    # gnome.gnome-settings-daemon
    android-udev-rules
  ];
  
  services.hardware.bolt.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  hardware.bluetooth.enable = true;
  
  # steam hardware
  # hardware.steam-hardware.enable = true;

  security.polkit.enable = true;
  
  services.fwupd.enable = true;
  services.openssh.enable = true;
  services.flatpak.enable = true;
  services.v2raya.enable = true;
}
