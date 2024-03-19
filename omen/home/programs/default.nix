{ pkgs, ... }: 
{
  imports = [
    ./browser.nix
    ./direnv.nix
    ./emacs.nix
    ./fzf.nix
    ./git.nix
    ./neovim.nix
    ./tmux.nix
  ];
}
