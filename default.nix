{ pkgs ? import <nixpkgs> {
    inherit system;
  }
, system ? builtins.currentSystem }:

let
  db = pkgs.callPackage ./db { };
  backend = (pkgs.callPackage ./backend { }).package;
in
  pkgs.stdenv.mkDerivation {
    name = "cfp";
    version = "1.0.0";

    src = ./.;

    phases = [ "installPhase" ];

    installPhase = ''
    mkdir -p $out/bin

    ln -s ${db}/bin/cfp-sqitch $out/bin/cfp-sqitch
    ln -s ${backend}/bin/cfp-backend $out/bin/cfp-backend
    '';
  }
