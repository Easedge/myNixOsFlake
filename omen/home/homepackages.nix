{ lib, config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # pkgs.stable.xxx
    nixpkgs-fmt
    htop
    sdcv
    vscode-fhs
    google-chrome
    firefox
    thunderbird
    telegram-desktop
    spotify
    scrcpy
    # teamviewer rustdesk todesk
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
    extraConfig = ''
    '';
    # extraPackages = [];
  };

  services.emacs = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "Rodney Chang";
    userEmail = "zhangrundide@gmail.com";
    # signing = {
    #   key = "0xAABBCC0123456789";
    #   signByDefault = true;
    # };
    extraConfig = {
      http = {
        proxy = "socks5h://127.0.0.1:7890";
      };
      https = {
        proxy = "socks5h://127.0.0.1:7890";
      };
    };
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}
