{ lib, config, pkgs, ... }:

{
  home.packages = with pkgs; [
    htop
    neofetch
    sdcv
    rustdesk
    drawio
    scrcpy
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
  
  programs.tmux = {
    enable = true;
  };
  
  programs.emacs = {
    enable = true;
    package = [
      pkgs.emacs
    ];
    extraConfig = ''
    '';
    extraPackages = [];
  };
  
  services.emacs = {
    enable = true;
  };
  
  programs.vscode = {
    enable = true;
    package = [
      pkgs.vscode-fhs
    ];
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
