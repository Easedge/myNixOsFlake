{ lib, config, pkgs, ... }:
{
  home.packages = with pkgs; [
    nixfmt
    nixpkgs-fmt
    libxml2
    graphviz
    gnuplot
    clang-tools
    glslang
    jdk
    pipenv
    gopls
    gomodifytags
    gotests
    gore
    gotools
    cargo
    rustc
    rust-analyzer
    shfmt
    shellcheck
    html-tidy
    stylelint
  ] ++ (with python3Packages;[
    grip
    black
    pyflakes
    isort
    pynose
    pytest
    jsbeautifier
  ]);
}
