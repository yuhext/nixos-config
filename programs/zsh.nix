{ config, pkgs, ... }:

{
  # -------------------- Zsh --------------------

  # 设置 zsh 为默认终端
  users.defaultUserShell = pkgs.zsh;

  programs.zsh = {
    enable = true;

    # zsh 插件
    autosuggestions.enable = true; # 自动建议
    syntaxHighlighting.enable = true; # 高亮

    # oh-my-zsh 设置
    ohMyZsh = {
      enable = true;
      theme = "gentoo"; # Gentoo 主题
      plugins = [
        "git"
      ];
      customPkgs = [
        pkgs.zsh-completions
        pkgs.nix-zsh-completions
      ];
    };
  };

  # -------------------- Zsh --------------------
}