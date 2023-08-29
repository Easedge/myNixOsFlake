{ ... }:
{
  programs = {
    steam = {
      enable = true;
      package = pkgs.steam.override {
        # Chinese fonts for steam
        extraPkgs = p: with p; [ wqy_zenhei ];
      };
    };
  };
}
