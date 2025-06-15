{ config, pkgs, lib, inputs, ... }:

#------ configuration specific to my desktop PC ------#

{

  ##########################
  # ALICEBOX CONFIGURATION #
  ##########################

  hardware.cpu.amd.updateMicrocode = true;
  programs.adb.enable = true;
  users.users.cardinal.extraGroups = ["adbusers"];

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
      ./../../modules/nix/nvf.nix
      ./../../modules/nix/networking.nix

    ];


  home-manager =
  {
    extraSpecialArgs = { inherit inputs; };
    users =
    {
      "cardinal" = import ./home.nix;
    };
  };

    system.stateVersion = "24.11";

}
