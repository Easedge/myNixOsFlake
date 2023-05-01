{ lib, config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # util
    tree
    tmux
    wget
    curl
    fd
    ripgrep
    p7zip
    unrar
    unzip
    fuse
    appimage-run
    # complie
    gcc
    clang
    gnumake
    cmake
    autoconf
    m4
    util-linux
    binutils
    coreutils
    nixfmt
    nixpkgs-fmt
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
