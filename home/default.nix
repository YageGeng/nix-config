{ config, pkgs, lib, ... }:

{
  home = {
    username = "isbest";
    homeDirectory = "/home/isbest";
    stateVersion = "25.05";
  };

  imports = [
    ./git.nix
    ./ssh.nix
    ./bash.nix
    ./programs.nix
    ./starship.nix
    ./fastfetch.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
