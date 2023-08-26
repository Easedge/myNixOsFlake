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
    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    bpftrace # powerful tracing tool
    lsof # list open files
    # system tools
    ethtool
    pciutils # lspci
    usbutils # lsusb
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
