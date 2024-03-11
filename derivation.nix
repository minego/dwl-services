{ lib, pkgs, stdenv, wayland, conf ? null, inputs, ... }:

let
	python = pkgs.python3.withPackages (
		ps: [
			ps.pydbus
			ps.dbus-python
			ps.pyxdg
		]
	);

in

stdenv.mkDerivation {
	src						= ./.;
	name					= "dwl-services";

	buildInputs = with pkgs; [
		meson
		ninja
		pkg-config
	];

	mesonFlags = [
		"--prefix=$out"
	];

	dontConfigure = true;
	buildPhase = ''
		mkdir $out
		meson setup --prefix=$out build
	'';
	installPhase = ''
		meson install -C build
	'';
}


