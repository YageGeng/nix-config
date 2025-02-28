{ 
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./i18n.nix
    ./packages.nix
    ./zram.nix
    ./boot.nix
    ./user.nix
  ];
}
