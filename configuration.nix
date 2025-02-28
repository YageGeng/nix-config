# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

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
  
  nix.settings = {
    substituters = ["https://mirror.sjtu.edu.cn/nix-channels/store"];
    experimental-features = ["nix-command" "flakes"];
  };

  nixpkgs.config.allowUnfree = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  console.useXkbConfig = true;
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [ "en_US.UTF-8/UTF-8" "zh_CN.UTF-8/UTF-8" ];
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-chinese-addons
        fcitx5-mozc
        fcitx5-gtk
        fcitx5-pinyin-moegirl
        fcitx5-pinyin-zhwiki 
      ]; 
      settings = {
        addons = {
	  classicui.globalSection = {
	    Theme = "plasma";
	    DarkTheme = "plasma";
	    Font = "Sans 12";
	    MenuFont = "Sans 12";
	    TrayFont = "Sans Bold 10";
	  };
          pinyin.globalSection = {
            PageSize = 5;
	    EmojiEnabled = "True";
            CloudPinyinIndex = 2;
            CloudPinyinEnabled = "True";
          };
          cloudpinyin.globalSection = {
            Backend = "Baidu";
          };
        };
      };
    };
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "caps:swapescape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.isbest = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
      git
      neovim
      microsoft-edge
      motrix
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    mihomo
  ];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.plasma6.excludePackages = with pkgs; [
    kdePackages.elisa
    kdePackages.xwaylandvideobridge
  ];

  fonts.packages = with pkgs; [
    iosevka
    noto-fonts
    liberation_ttf
    twemoji-color-font
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    nerd-fonts.symbols-only
  ];
  
  fonts = {
    enableDefaultPackages = true;
    fontconfig = {
      defaultFonts = {
        serif = [ "Noto Serif CJK SC" "Noto Serif" "Twitter Color Emoji" ];
        sansSerif = [ "Noto Sans CJK SC" "Noto Sans" "Twitter Color Emoji" ];
        monospace = [ "Noto Sans Mono CJK SC" "Symbols Nerd Font" "Twitter Color Emoji" ];
      };
    };
  };

  services.mihomo.tunMode = true;
  services.mihomo.enable = true;
  services.mihomo.configFile = ./clash/config.yaml;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?

}

