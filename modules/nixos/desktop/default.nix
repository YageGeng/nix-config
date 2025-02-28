{ 
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./fonts.nix
    ./misc.nix
    ./packages.nix
    ./peripherals.nix
    ./mihomo.nix
    ./fcitx5.nix
    ./plasma6.nix
  ];
}
