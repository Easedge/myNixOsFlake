{ inputs, pkgs, ... }:
{

  # with daed
  services.daed = {
    enable = true;
    configDir = "/etc/daed";
    listen = "0.0.0.0:2023";
    openFirewall = {
      enable = true;
      port = 12345;
    };
  };

  # or with dae
  services.dae = {
    enable = true;
    disableTxChecksumIpGeneric = false;
    configFile = "/etc/dae/config.dae";
    assets = with pkgs; [ v2ray-geoip v2ray-domain-list-community ];
    openFirewall = {
      enable = true;
      port = 12345;
    };
  };


  # use packages
  environment.systemPackages =
    with inputs.daeuniverse.packages.x86_64-linux;
    [ dae daed ];
}
