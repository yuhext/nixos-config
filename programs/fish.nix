{ config, pkgs, ... }:

{
  # -------------------- Fish --------------------

  # 设置 fish 为默认终端
  users.defaultUserShell = pkgs.fish;

  programs.fish = {
    enable = true;

    promptInit = ''
      set -U fish_greeting ""
    '';
  };

  # -------------------- Fish --------------------
}