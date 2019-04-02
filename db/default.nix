{pkgs ? import <nixpkgs> {
    inherit system;
  }
, system ? builtins.currentSystem }:

pkgs.stdenv.mkDerivation {
  name = "cfp-db";
  version = "1.0.0";

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
  sqitch \$@
  EOF
  chmod +x $out/bin/cfp-sqitch

  # cfp-db-init
  cat > $out/bin/cfp-db-init <<EOF
  #!/usr/bin/env bash
  ${pkgs.postgresql}/bin/createdb -e cfp
  ${pkgs.postgresql}/bin/psql -d cfp -c 'CREATE ROLE postgraphile LOGIN;'
  ${pkgs.postgresql}/bin/psql -d cfp -c 'GRANT ALL PRIVILEGES ON DATABASE cfp TO postgraphile;'
  echo 'database initialized. Now set the application password for postgraphile.'
  EOF
  chmod +x $out/bin/cfp-db-init
  '';
}
