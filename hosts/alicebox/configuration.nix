{ config, pkgs, lib, inputs, ... }:

{

  #########
  # NIXOS #
  #########

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  home-manager.backupFileExtension = "backup";

  ########
  # BOOT #
  ########

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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


  ##########
  # LOCALE #
  ##########

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings =
  {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  ###########
  # DISPLAY #
  ###########

  services.xserver.enable = true;
  services.displayManager.ly.enable =  true;
  services.desktopManager.plasma6.enable = true;
  services.xserver.xkb = { layout = "us"; variant = ""; };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  ############
  # SERVICES #
  ############

  services.printing.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire =
  {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
    #media-session.enable = true;
  };

  # services.xserver.libinput.enable = true;

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

  ###################
  # SYSTEM PACKAGES #
  ###################

  programs.zsh.enable = true;
  programs.firefox.enable = true;
  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    fastfetch
    rivalcfg
    git
    wget
    curl
    gh
    thefuck
  ];

  virtualisation.vmware.host.enable = true;

  nixpkgs.config.permittedInsecurePackages = [ "freeimage-unstable-2021-11-01" ];

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
