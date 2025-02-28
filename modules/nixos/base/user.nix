{ 
  config,
  lib,
  pkgs,
  ...
}: {
  users.users.isbest = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "users"
      "networkmanager"
    ];
  };
}
