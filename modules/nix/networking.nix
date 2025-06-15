{ config, pkgs, lib, inputs, ... }:

#------ configuration for networking utilities ------#

{
  networking.hostName = "alicebox";
  networking.networkmanager.enable = true;

  networking.firewall =
  {
    allowedUDPPorts = [  ];
    allowedTCPPorts = [ ];
  };

    environment.systemPackages = with pkgs;
  [
      protonvpn-gui
      qbittorrent
      nixos-firewall-tool
  ];


}
