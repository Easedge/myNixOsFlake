{ config, pkgs, ... }:
{
  programs = {
    steam = {
      enable = true;
      package = pkgs.steam.override {
        extraPkgs = p: with p; [
          wqy_zenhei
        ];
      };
    };
  };
  hardware.steam-hardware.enable = true;
}
