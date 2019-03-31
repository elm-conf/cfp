with import (builtins.fetchTarball rec {
  # grab a hash from here: https://nixos.org/channels/
  name = "nixpkgs-darwin-18.09pre153971.2d656a97297";
  url = "https://github.com/nixos/nixpkgs/archive/2d656a9729739e8ca5486058a76669d0ea4442df.tar.gz";
  # Hash obtained using `nix-prefetch-url --unpack <url>`
  sha256 = "00aqc7am069vgmlg60v55hjahv7kkfkn9z6lwirqr1wzpcgll3v1";
}) {};

let
  npm = callPackage ./npm { };
in
  stdenv.mkDerivation {
    name = "cfp";
    buildInputs = [
      foreman
      git
      gnumake
      postgresql100
      sqitchPg

      # node stuff. Get exact versions by looking at npm/package.json
      nodejs-8_x
      nodePackages.node2nix
      nodePackages.npm

      # deployment
      doctl
    ];
  }
