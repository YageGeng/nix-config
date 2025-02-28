{ 
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  nix.settings = {
    substituters = ["https://mirror.sjtu.edu.cn/nix-channels/store"];
    experimental-features = ["nix-command" "flakes"];
  };

  nixpkgs.config.allowUnfree = true;

  networking = {
    networkmanager.enable = true;
    hostName = "nixos";
  };

  system.stateVersion = "24.11";
}

