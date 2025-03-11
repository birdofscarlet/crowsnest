{ config, pkgs, lib, inputs, ... }:

{
services.gnome.gnome-keyring.enable = true;
systemd.user.services.protonmail-bridge = {
description = "Protonmail Bridge";
enable = true;
script = "${pkgs.protonmail-bridge}/bin/protonmail-bridge --noninteractive --log-level info";
path = [ pkgs.gnome-keyring ]; # HACK: https://github.com/ProtonMail/proton-bridge/issues/176
wantedBy = [ "graphical-session.target" ];
partOf = [ "graphical-session.target" ];        };
}
