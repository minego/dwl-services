{ config, pkgs, lib, ... }:
with lib;

{
	systemd.user.services = {
		"dwl" = {
			description				= "DWL";
			serviceConfig = {
				Type				= "notify";
				ExecStart			= "${pkgs.dwl}/bin/dwl";
				NotifyAccess		= "all";
				ExecStopPost		= "systemctl --user unset-environment DISPLAY WAYLAND_DISPLAY";
			};
		};
	};
}
