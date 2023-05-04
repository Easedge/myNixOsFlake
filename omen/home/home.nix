{ inputs, outputs, lib, config, ... }:

{
  imports = [
    ./homepackages.nix
  ];

  home.stateVersion = "23.05";
}
