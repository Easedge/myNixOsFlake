{ lib, config, pkgs, ... }:
{
  home.packages = with pkgs; [
    nixfmt
    nixpkgs-fmt
    graphviz
    gnuplot
    ccls
    jdk
    jdt-language-server
    pipenv
    gopls
    rust-analyzer
    shfmt
    shellcheck
    html-tidy
    stylelint
  ] ++ (with python3Packages;[
    grip
    libxml2
    black
    pyflakes
    isort
    pynose
    pytest
    jsbeautifier
  ]);
}
