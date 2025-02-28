{
  config,
  pkgs,
  ...
}: {
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
    vscode
  ];
}
