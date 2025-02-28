{ 
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    mihomo
  ];

  services.mihomo.tunMode = true;
  services.mihomo.enable = true;
  services.mihomo.configFile = ./config.yaml;
}
