{ inputs, pkgs, ... }:
{
  programs.clash-verge = {
    enable = true;
    tunMode = true;
    autoStart = true;
  };
}
