{ config, pkgs, lib, inputs, ... }:

{

  #########
  # NIXOS #
  #########

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./../../modules/nix/core.nix
      ./../../modules/nix/plasma.nix
      inputs.home-manager.nixosModules.default
    ];


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
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;


  #########
  # USERS #
  #########

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cardinal =
  {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "cardinal";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs;
    [

    ];
  };

  home-manager =
  {
    extraSpecialArgs = { inherit inputs; };
    users =
    {
      "cardinal" = import ./home.nix;
    };
  };



  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:


  system.stateVersion = "24.11";

}
