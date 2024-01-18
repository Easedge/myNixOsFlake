{ lib, config, pkgs, ... }:

{
  # programs.fish = {
  #   enable = true;
  #   vendor.functions.enable = true;
  #   shellInit = ''
  #     direnv hook fish | source
  #   '';
  #   promptInit = "set -g direnv_fish_mode eval_on_arrow";
  #   shellAliases = {
  #     emc = "emacsclient";
  #   };
  # };

  programs.bash = {
    enable = true;
    enableLsColors = true;
    enableCompletion = true;
    blesh.enable = true;
    shellInit = ''
      eval "$(direnv hook bash)"
    '';
    promptInit = "";
    shellAliases = {
      emc = "emacsclient";
    };
  };

  environment.shells = [
    pkgs.bashInteractive
    # pkgs.fish
  ];
}
