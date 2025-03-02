# core user programs shared across both hosts
{ config, pkgs, lib, inputs, ... }:
{

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

}
