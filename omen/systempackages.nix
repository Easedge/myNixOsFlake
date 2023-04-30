{ lib, config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # util
    tree
    tmux
    wget
    curl
    fd
    clang
    ripgrep
    p7zip
    unrar
    unzip
    fuse
    # complie
    gcc
    gnumake
    autoconf
    m4
    util-linux
    binutils
    zlib
    stdenv.cc
    coreutils
    nixfmt
    nixpkgs-fmt
    appimage-run
    distrobox
    # ios mobile
    libimobiledevice
    ifuse
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
