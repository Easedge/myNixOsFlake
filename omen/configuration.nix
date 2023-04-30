{ inputs, outputs, lib, config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./systemservices.nix
      ./systempackages.nix
      ./shellsettings.nix
      ./virtualisation.nix
      ./flatpak-bindfs.nix
      ./gnomepackages.nix
      ./nvidia.nix
      ./cuda.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.consoleMode = "max";
  boot.loader.systemd-boot.configurationLimit = 3;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "omen";
  networking.networkmanager.enable = true;
  networking.iproute2.enable = true;

  time.timeZone = "Asia/Shanghai";

  i18n.defaultLocale = "zh_CN.UTF-8";
  i18n.supportedLocales = [ "zh_CN.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
  i18n.inputMethod = {
    # enabled = "fcitx5";
    # fcitx.engines = with pkgs.fcitx-engines; [ rime ];
    # fcitx5.enableRimeData= true;
    # fcitx5.addons = with pkgs; [
    #   fcitx5-rime
    #   fcitx5-configtool
    # ];
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ rime ];
  };

  fonts = {
    enableDefaultFonts = true;
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      noto-fonts-extra
      sarasa-gothic
      font-awesome
      symbola
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "Noto"
        ];
      })
    ];
    fontconfig = {
      defaultFonts = {
        emoji = [
          "Noto Color Emoji"
        ];
        monospace = [
          "Noto Sans Mono CJK SC"
        ];
        sansSerif = [
          "NotoSans Nerd Font"
          "Sarasa Gothic SC"
        ];
        serif = [
          "Noto Serif CJK SC"
          "NotoSerif Nerd Font"
        ];
      };
      cache32Bit = true;
    };
    fontDir.enable = true;
    enableGhostscriptFonts = true;
  };

  users.users.junglefish = {
    isNormalUser = true;
    description = "junglefish";
    shell = pkgs.fish;
    extraGroups = [
      "wheel"  "tty" "audio" "video"
      "networkmanager" "lp"
      "kvm" "libvirtd" "docker"
    ];
  };

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
    extraOptions = ''
     keep-outputs = true
     keep-derivations = true
    '';
  };
  system.stateVersion = "23.05";
}

