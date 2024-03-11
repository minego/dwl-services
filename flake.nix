{
	description = "dwl-services - A collection of tools, utilities and mostly unit files to handle a systemd-user DWL session";

	inputs = {
		nixpkgs = {
			url = "github:NixOS/nixpkgs/nixos-unstable";
		};

		# Override the systems for the flake, because this only builds on Linux
		systems = {
			url = "github:nix-systems/default-linux";
		};

		flake-utils = {
			url	= "github:numtide/flake-utils";
			inputs.systems.follows = "systems";
		};
	};

	outputs = { self, nixpkgs, flake-utils, ... }@inputs:

	let
		overlay = final: prev: {
			dwl-services			= prev.pkgs.callPackage ./derivation.nix { inherit inputs; };
		};
	in

	flake-utils.lib.eachDefaultSystem (system:
		let
			pkgs = nixpkgs.legacyPackages.${system}.extend overlay;
		in rec {
			packages.dwl-services	= pkgs.dwl-services;

			packages.default		= packages.dwl-services;
			devShells.default		= import ./shell.nix { inherit pkgs; };
		}
	)
	//
	{
		overlays.default			= overlay;
	};
}


