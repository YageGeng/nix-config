{
  config,
  pkgs,
  ...
}: {
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
    };
  };
}
