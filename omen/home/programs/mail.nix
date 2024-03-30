{ config, lib, pkgs, ... }:

with lib;
let
  name = "Rodney Chang";
  maildir = "/home/junglefish/.mail";
  email = "junglefish.sgl@outlook.com";
in
{
  home.packages = with pkgs; [ mu isync pass mutt-wizard ];
  home.accounts.email = {
    maildirBasePath = "${maildir}";
    accounts = {
      UTD = {
        address = "${email}";
        userName = "${email}";
        flavor = "plain";
        passwordCommand = "${pkgs.pass}/bin/pass outlook";
        imap = {
          host = "outlook.office365.com";
          port = 993;
          tls.enable = true;
        };
        realName = "${name}";
        msmtp.enable = true;
        smtp = {
          host = "smtp-mail.outlook.com";
          port = 587;
          tls.useStartTls = true;
        };
      };
    };
  };


  programs = {
    msmtp.enable = true;
    mbsync.enable = true;
  };

  services = {
    mbsync = {
      enable = true;
      frequency = "weekly";
      preExec = "${pkgs.isync}/bin/mbsync -Ha";
      postExec = "${pkgs.mu}/bin/mu index -m ${maildir}";
    };
  };

};
