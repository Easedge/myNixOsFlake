{ lib, config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # gnome
    gnome.gnome-tweaks
    gnome.dconf-editor
    gnomeExtensions.appindicator
    gnomeExtensions.vitals
    gnomeExtensions.docker
    gnomeExtensions.systemd-manager
    gnomeExtensions.caffeine
    gnomeExtensions.blur-my-shell
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
    coreutils
    nixfmt
    nixpkgs-fmt
    appimage-run
    distrobox
    # ios mobile
    libimobiledevice
    ifuse
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
