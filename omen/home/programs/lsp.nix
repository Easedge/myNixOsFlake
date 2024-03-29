{ lib, config, pkgs, ... }: {
  home.packages = with pkgs;
    [
      nixfmt
      nixpkgs-fmt
      pandoc
      libxml2
      graphviz
      gnuplot
      clang-tools
      glslang
      jdk
      jdt-language-server
      python3
      pipenv
      guile
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
    ] ++ (with python3Packages; [
      grip
      python-lsp-server
      black
      pyflakes
      isort
      pynose
      pytest
      jsbeautifier
    ]);

  home.sessionVariables = {
    GUIX_LOCPATH = "$HOME/.guix-profile/lib/locale";
  };
}
