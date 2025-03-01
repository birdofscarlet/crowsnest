{
  description = "welcome to the crow's nest";

  inputs =
  {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, ... } @ inputs:
  let
    pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
    system = "x86_64-linux";
    username = "cardinal";
  in
  {

    nixosConfigurations.alicebox = nixpkgs.lib.nixosSystem
    {
      specialArgs = { inherit inputs system username; };
      modules =
      [
        ./hosts/alicebox/configuration.nix
        ./hosts/alicebox/hardware-configuration.nix
        inputs.home-manager.nixosModules.default
      ];

    };



  };
}
