{ lib, config, pkgs, ... }:
{
  home.packages = with pkgs; [
    nixfmt
    nixpkgs-fmt
    libxml2
    graphviz
    gnuplot
    ccls
    clang-tools
    glslang
    jdk
    jdt-language-server
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
    python-lsp-server
    black
    pyflakes
    isort
    pynose
    pytest
    jsbeautifier
  ]);
}
