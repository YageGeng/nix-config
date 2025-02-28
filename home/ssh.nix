{
  config,
  pkgs,
  ...
}: {
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
}
