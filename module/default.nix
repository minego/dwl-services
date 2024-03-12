{ config, pkgs, lib, ... }:
with lib;

{
	systemd.user = {
		services = {
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

		targets = {
			dwl-session = {
				description				= "Current DWL user session";
				requires				= [ "basic.target" ];
				bindsTo					= [ "wayland-session.target" ];
				before					= [ "wayland-session.target" ];

				unitConfig = {
					RefuseManualStart	= true;
					StopWhenUnneeded	= true;
				};
			};

			dwl-session-pre = {
				description				= "Session services which should run early before the DWL session is brought up";
				requires				= [ "basic.target" ];
				before					= [ "dwl-session.target" "wayland-session-pre.target" ];
				bindsTo					= [ "wayland-session-pre.target" ];

				unitConfig = {
					RefuseManualStart	= true;
					StopWhenUnneeded	= true;
				};
			};

			wayland-session = {
				description				= "Current wayland user session";
				requires				= [ "basic.target" ];
				bindsTo					= [ "graphical-session.target" ];

				unitConfig = {
					RefuseManualStart	= true;
					StopWhenUnneeded	= true;
				};
			};

			wayland-session-pre = {
				description				= "Session services which should run early before the wayland session is brought up";
				requires				= [ "basic.target" ];
				before					= [ "wayland-session.target" ];
				bindsTo					= [ "graphical-session-pre.target" ];

				unitConfig = {
					RefuseManualStart	= true;
					StopWhenUnneeded	= true;
				};
			};
		};
	};
}
