{pkgs ? import <nixpkgs> {
    inherit system;
  }
, system ? builtins.currentSystem }:

pkgs.stdenv.mkDerivation {
  name = "cfp-db";
  version = "2.2.0";

  src = ./.;

  buildInputs = [ pkgs.bash pkgs.sqitchPg pkgs.postgresql ];

  buildPhase = ''
  env HOME=$(pwd) ${pkgs.sqitchPg}/bin/sqitch --verbose bundle
  '';

  installPhase = ''
  echo $out
  mkdir -p $out/lib/cfp-db
  cp -R bundle/* $out/lib/cfp-db/

  mkdir $out/bin

  # cfp-sqitch
  cat > $out/bin/cfp-sqitch <<EOF
  #!/usr/bin/env bash
  set -euo pipefail
  cd $out/lib/cfp-db
  exec ${pkgs.sqitchPg}/bin/sqitch \$@
  EOF
  chmod +x $out/bin/cfp-sqitch
  '';
}
