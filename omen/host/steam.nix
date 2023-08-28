{ config, pkgs, ... }:
{
  programs = {
    steam = {
      enable = false;
      # package = pkgs.steam.override {
      #   extraPkgs = p: with p; [
      #     wqy_zenhei
      #   ];
      # };
    };
  };
  hardware.steam-hardware.enable = true;
}
