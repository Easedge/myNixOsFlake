{ config, pkgs, ... }:
{
  programs = {
    steam = {
      enable = true;
      package = pkgs.steam.override {
        extraPkgs = p: with p; [
          corefonts
          ubuntu_font_family
          noto-fonts-cjk
          wqy_zenhei
        ];
      };
    };
  };
  hardware.steam-hardware.enable = true;
}
