{ config, pkgs, ... }:

{
  home.username = "cardinal";
  home.homeDirectory = "/home/cardinal";
  home.stateVersion = "24.05";

  imports =
  [
    ./../../modules/home-manager/zsh.nix
  ];

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

  home.file =
  {
  };

  home.sessionVariables =
  {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
