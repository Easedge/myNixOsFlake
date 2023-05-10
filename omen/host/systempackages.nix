{ lib, config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # util
    tree
    wget
    curl
    p7zip
    unrar
    unzip
    # complie
    gcc
    gdb
    gnumake
    nixfmt
    nixpkgs-fmt
    # mobile
    ifuse
    libimobiledevice
  ];

  programs.adb.enable = true;
  
  programs.kdeconnect = {
    enable = true;
    # package = pkgs.gnomeExtensions.gsconnect;
    package = pkgs.plasma5Packages.kdeconnect-kde;
  };

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
