{
  description = "welcome to the crow's nest";

  inputs =
  {
    # nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nvf.url = "github:notashelf/nvf";
  };

  outputs = { self, nixpkgs, nvf, ... } @ inputs:
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
        nvf.nixosModules.default
      ];

    };

    devShells.x86_64-linux.default = (import ./dev/shell.nix { inherit pkgs; });

  };
}
