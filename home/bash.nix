{
  config,
  pkgs,
  ...
}: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
    '';

    shellAliases = {
      neofetch = "fastfetch";
      vi = "nvim";
      vim = "nvim";
    };
  };
}
