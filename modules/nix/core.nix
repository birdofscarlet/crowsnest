{ config, pkgs, lib, inputs, ... }:

#------ configuration shared across all PC hosts ------#

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
  programs.steam.extraCompatPackages = with pkgs; [ proton-ge-bin ];

  environment.systemPackages = with pkgs;
  [
    proton-pass
    protonmail-desktop
    obs-studio
    kdePackages.kdenlive
    fastfetch
    rivalcfg
    git
    wget
    curl
    gh
    thefuck
    vlc
    ntfs3g
    fd
    fzf
    btop
    wineWowPackages.stable
    gimp
    virtualbox
  ];

  fonts.packages = with pkgs; [

];

  nixpkgs.config.permittedInsecurePackages =
  [
  "freeimage-unstable-2021-11-01"
  "dotnet-sdk-6.0.428"
  "dotnet-runtime-6.0.36"
  ];

  ########
  # BOOT #
  ########

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  ############
  # SERVICES #
  ############

  services.flatpak.enable = true;
  services.printing.enable = true;
  security.rtkit.enable = true;

  services.pipewire =
  {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  ##########
  # LOCALE #
  ##########

  time.timeZone = "America/Chicago";
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


  #########
  # USERS #
  #########

  users.users.cardinal =
  {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "cardinal";
    extraGroups = [ "networkmanager" "wheel" ];
  };



}
