{ config, pkgs, lib, ... }:
with lib;

{
	systemd.services = {
		"dwl" = {
			description				= "DWL";
			serviceConfig = {
				Type				= "notify";
				ExecStart			= "dwl";
				Restart				= "on-failure";
				RestartSec			= 1;
				TimeoutStopSec		= 10;
				NotifyAccess		= "all";
				ExecStopPost		= "/usr/bin/systemctl --user unset-environment DISPLAY WAYLAND_DISPLAY";
			};
		};
	};
}
