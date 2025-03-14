{ config, pkgs, lib, inputs, ... }:
{

programs.zsh =
  {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    autocd = true;

    shellAliases =
    {
      "ll" = "ls -l";
      "la" = "ls -a";
      ".." = "cd ..";
      "rebuild" = "sudo nixos-rebuild switch";
      "test" = "sudo nixos-rebuild test";
      "drybuild" = "sudo nixos-rebuild dry-build";
      "rebuildab" = "sudo nixos-rebuild switch --flake ~/crowsnest#alicebox";
      "testab" = "sudo nixos-rebuild test --flake ~/crowsnest#alicebox";
    };

    oh-my-zsh =
    {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "bureau";
    };

    initExtra = "fastfetch";

  };

}
