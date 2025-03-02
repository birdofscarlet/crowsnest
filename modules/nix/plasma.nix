  { config, pkgs, lib, inputs, ... }:

  {
  ###########
  # DISPLAY #
  ###########

  services.xserver.enable = true;
  services.displayManager.ly.enable =  true;
  services.desktopManager.plasma6.enable = true;
  services.xserver.xkb = { layout = "us"; variant = ""; };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  }
