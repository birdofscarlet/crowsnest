{ config, pkgs, lib, inputs, ... }:

{
  home.packages = with pkgs;
  [
    libgcc
    xorg.libX11
    mesa
    gnumake42
    msbuild
  ];

  nixpkgs.config.permittedInsecurePackages =
  [
  "freeimage-unstable-2021-11-01"
  "dotnet-sdk-6.0.428"
  "dotnet-runtime-6.0.36"
  ];

}
