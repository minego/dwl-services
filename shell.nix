{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
	name = "dwl-services shell";

	nativeBuildInputs = with pkgs; [
		pkg-config
	];

	buildInputs = with pkgs; [
		gdb
	];
}
