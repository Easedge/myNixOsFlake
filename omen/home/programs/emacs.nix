{ lib, config, pkgs, ... }:

{
  # nixpkgs.overlays = [
  #   (import (builtins.fetchTarball {
  #     url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
  #   }))
  # ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
    # package = pkgs.emacs-unstable;
    extraConfig = ''
    '';
    # extraPackages = [];
  };

  services.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
    # package = pkgs.emacs-unstable;
  };

  home.packages = with pkgs; [
    nodejs
    wmctrl
    xdotool
    aria
  ] ++ (with python3Packages;[
    pandas
    requests
    sexpdata
    tld
    pyqt6
    pyqt6-sip
    pyqt6-webengine
    epc
    lxml # for eaf
    qrcode # eaf-file-browser
    pysocks # eaf-browser
    pymupdf # eaf-pdf-viewer
    pypinyin # eaf-file-manager
    psutil # eaf-system-monitor
    retry # eaf-markdown-previewer
    markdown
  ]);

  home.sessionVariables = {
    QT_QPA_PLATFORM_PLUGIN_PATH = "${pkgs.qt6.qtbase.outPath}/lib/qt-6/plugins";
  };
}
