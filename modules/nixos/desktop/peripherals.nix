{ 
  config,
  lib,
  pkgs,
  ...
}: {
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  security.rtkit.enable = true;
  hardware.bluetooth.enable = true;

  services = {
    printing.enable = true; # Enable CUPS to print documents.
    libinput.enable = true;
    xserver.xkb.layout = "us";
    xserver.xkb.options = "caps:swapescape";
  };
}
