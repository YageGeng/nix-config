{ 
  config,
  lib,
  pkgs,
  ...
}: {
  environment.shells = with pkgs; [
    bashInteractive
  ];

  users.defaultUserShell = pkgs.bashInteractive;

  # fix for `sudo xxx` in kitty/wezterm/foot and other modern terminal emulators
  security.sudo.keepTerminfo = true;

  environment.variables = {
    # fix https://github.com/NixOS/nixpkgs/issues/238025
    TZ = "${config.time.timeZone}";
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # disable the firewall
  networking.firewall.enable = false;
}
