{ config, pkgs, ... }:

{
  home.username = "isbest";
  home.homeDirectory = "/home/isbest";

  home.packages = with pkgs; [
    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    fzf # A command-line fuzzy finder

    # networking tools
    dnsutils  # `dig` + `nslookup`

    # misc
    file
    which
    tree

    # nix related
    nix-output-monitor

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # programs
    neovim
    motrix
    microsoft-edge
  ];

  # git 相关配置
  programs.git = {
    enable = true;
    userName = "GengYage";
    userEmail = "icoderdev@gmail.com";
  };

  # 启用 starship，这是一个漂亮的 shell 提示符
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    # 自定义配置
    settings = {
      # 禁止在提示符之间插入空行
      add_newline = false;
      # 禁用aws
      aws.disabled = true;
      # 禁用gcloud
      gcloud.disabled = true;
      # line_break.disabled = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO 在这里添加你的自定义 bashrc 内容
    bashrcExtra = ''
    '';

    shellAliases = {
      neofetch = "fastfetch";
      vi = "nvim";
      vim = "nvim";
    };
  };

  programs.fastfetch = {
    enable = true;
    settings = {
      modules = [
        "title"
        "separator"
        "os"
        "host"
        "kernel"
        "uptime"
        "packages"
        "shell"
        "display"
        "de"
        "wm"
        "theme"
        "icons"
        "font"
        "terminal"
        "cpu"
        "gpu"
        "memory"
        "disk"
        "break"
        "colors"
      ];
    };
  };

  programs.ssh = {
    enable = true;
      matchBlocks = {
        "github.com" = {
	  hostname = "github.com";
	  identityFile = "~/.ssh/github";
        };
        "gitee.com" = {
	  hostname = "gitee.com";
	  identityFile = "~/.ssh/gitee";
        };
    };
  };


  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
