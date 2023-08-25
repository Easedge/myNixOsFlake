{ pkgs ? import <nixpkgs> { } }:

let
  pythonEnv = pkgs.python3.withPackages (ps: [
    # ps.xxx
  ]);
in
pythonEnv.env
