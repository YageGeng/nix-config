{ 
  config,
  lib,
  pkgs,
  ...
}: {
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;
      consoleMode = "max";
      configurationLimit = 3;
      edk2-uefi-shell.enable = true;
      windows = {
        "windows" = {
          title = "Windows";
          efiDeviceHandle = "HD1b";
        };
      };
    };
  };
}
