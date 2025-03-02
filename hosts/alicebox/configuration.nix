{ config, pkgs, lib, inputs, ... }:

#------ configuration specific to my desktop PC ------#

{

  ##########################
  # ALICEBOX CONFIGURATION #
  ##########################

  hardware.cpu.amd.updateMicrocode = true;

  ###########
  # MODULES #
  ###########

  imports =
    [
      inputs.home-manager.nixosModules.default
      ./hardware-configuration.nix
      ./../../modules/nix/core.nix
      ./../../modules/nix/plasma.nix
      ./../../modules/nix/graphics-amd.nix
    ];


  home-manager =
  {
    extraSpecialArgs = { inherit inputs; };
    users =
    {
      "cardinal" = import ./home.nix;
    };
  };


  ###########
  # NETWORK #
  ###########

  networking.hostName = "alicebox";

  networking.networkmanager.enable = true;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # services.openssh.enable = true;

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  system.stateVersion = "24.11";

}
