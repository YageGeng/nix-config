{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "GengYage";
    userEmail = "icoderdev@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };
}
