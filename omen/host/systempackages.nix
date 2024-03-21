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
    # home-manager
    appimage-run
    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    bpftrace # powerful tracing tool
    lsof # list open files
    # system tools
    ethtool
    bridge-utils
    pciutils # lspci
    usbutils # lsusb
    efibootmgr
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
}
