{ lib, config, pkgs, ... }:

{
  home.packages = with pkgs; [
    emacs
    htop
    neofetch
    google-chrome
    microsoft-edge
    vscode-fhs
    jetbrains.pycharm-community
    rustdesk
    # nur
    # nur.repos.xxx
    # nixos-cn
    # nixos-cn.xxx
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  programs.git = {
    enable = true;
    userName = "Rodney Chang";
    userEmail = "zhangrundide@gmail.com";
    # signing = {
    #   key = "0xAABBCC0123456789";
    #   signByDefault = true;
    # };
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}
