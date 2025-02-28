{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    strace # system call monitoring
    ltrace # library call monitoring
    tcpdump # network sniffer
    lsof # list open files

    # system monitoring
    sysstat
    iotop
    iftop
    btop

    # system tools
    psmisc # killall/pstree/prtstat/fuser/...
    pciutils # lspci
    usbutils # lsusb
    parted
  ];
}
