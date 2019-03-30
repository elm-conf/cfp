{ pkgs ? import <nixpkgs> {} }:

let
  npm = pkgs.callPackage ./npm { };
in
  pkgs.stdenv.mkDerivation {
    name = "cfp";
    version = "1.0.0";
    src = ./.;

    phases = [ "unpackPhase" "installPhase" "fixupPhase" ];

    installPhase = ''
      BIN_DIR=$out/bin
      mkdir -p $BIN_DIR

      BIN=$BIN_DIR/cfp
      echo 'env NODE_PATH=${pkgs.nodejs-8_x}/lib/node_modules:${npm."@graphile-contrib/pg-simplify-inflector-3.0.0"}/lib/node_modules:${npm."postgraphile-4.3.3"}/lib/node_modules ${pkgs.nodejs-8_x}/bin/node ${./index.js}' > $BIN
      chmod +x $BIN
    '';
  }
