{ pkgs, ... }: 
{
  imports = [
    ./direnv.nix
    ./emacs.nix
    ./fzf.nix
    ./git.nix
    ./neovim.nix
    ./tmux.nix
    ./wine.nix
  ];
}
