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
    ./../../modules/home-manager/neovim.nix
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
    libreoffice-qt6-fresh
    (pkgs.callPackage ../../derivations/dungeondraft.nix {})
    wonderdraft
    kdePackages.kate
    discord
  ];

}
