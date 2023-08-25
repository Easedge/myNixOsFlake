{ lib, config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # pkgs.stable.xxx
    # util
    tree
    wget
    curl
    p7zip
    unrar
    unzip
    home-manager
    # complie
    gcc
    gdb
    gnumake
    # mobile
    ifuse
    libimobiledevice
  ];

  programs.adb.enable = true;

  services.usbmuxd = {
    enable = true;
    # package = pkgs.usbmuxd2;
  };

  programs.nix-ld.enable = true;

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
