#!/usr/bin/env bash
cd $(dirname $0)
node2nix --nodejs-8 --input package.json --composition default.nix --lock package-lock.json
