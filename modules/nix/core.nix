# core user configuration shared across all hosts
{ config, pkgs, lib, inputs, ... }:
{
  ###########################
  #   NIX-OS CONFIGURATION  #
  ###########################

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  home-manager.backupFileExtension = "backup";

  ###################
  # SYSTEM PACKAGES #
  ###################

  programs.firefox.enable = true;
  programs.steam.enable = true;
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs;
  [
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

  ########
  # BOOT #
  ########

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  ############
  # SERVICES #
  ############

  services.printing.enable = true;
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

}
