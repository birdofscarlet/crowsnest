{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell
{
    nativeBuildInputs = with pkgs;
    [
        gradle_8 jdk17
    ];
}
