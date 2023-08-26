{ ... }:
{
  programs.emacs = {
    enable = true;
    extraConfig = ''
    '';
    # extraPackages = [];
  };

  services.emacs = {
    enable = true;
  };
}
