{ config, pkgs, ... }:

#------ configuration specific to my desktop PC ------#

{

  ###########################
  #    HOME CONFIGURATION   #
  ###########################

  programs.home-manager.enable = true;
  home.username = "cardinal";
  home.homeDirectory = "/home/cardinal";
  home.stateVersion = "24.05";

  home.file =
  {
  };

  home.sessionVariables =
  {
  };

  ###########
  # MODULES #
  ###########

  imports =
  [
    ./../../modules/home-manager/zsh.nix
  ];

  ###################
  #    PACKAGES     #
  ###################

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs;
  [
    ringracers
    grimblast
    pcmanfm
    obsidian
    aseprite
    tutanota-desktop
    libreoffice-qt6-fresh
    (pkgs.callPackage ../../derivations/dungeondraft.nix {})
    wonderdraft
    kdePackages.kate
    discord
  ];

}
