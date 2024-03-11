# dwl-services

A collection of tools, utilities and mostly unit files to handle a systemd-user
dwl session.

Usage: run `DWL Service` from your desktop manager or run `dwl-user-service`.

## Provided targets

* `dwl-session.target`
* `dwl-session-pre.target`
* `wayland-session.target`
* `wayland-session-pre.target`

These targets are directly mapped to `graphical-session{,-pre}.target` but for
wayland exclusive services

## Provided services

* `dwl.service`

## Notes

The `dwl-ready` command must be run by dwl when it is loaded and ready, to
inform systemd that the unit has succeeded.

