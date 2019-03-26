npm-tools/default.nix: npm-tools/package.json
	cd npm-tools; node2nix --nodejs-8 --input package.json
