{ pkgs, ... }: 
{
  imports = [
    ./direnv.nix
    ./emacs.nix
    ./fzf.nix
    ./git.nix
    ./lsp.nix
    ./neovim.nix
    ./tmux.nix
    ./mail.nix
  ];
}
