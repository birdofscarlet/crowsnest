# rust :3c

{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell
{
    nativeBuildInputs = with pkgs;
    [
        rustc cargo gcc rustfmt clippy
    ];
}
