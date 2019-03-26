npm/default.nix: npm/package.json
	cd npm; node2nix --nodejs-8 --input package.json
