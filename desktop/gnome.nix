{ config, pkgs, ... }:

{
  # -------------------- GNOME --------------------

  # X11 窗口系统
  services.xserver = {
    enable = true;
    layout = "us"; # 键盘布局
    libinput.enable = true; # 触控板
  };

  # 显卡设置
  services.xserver.videoDrivers = [
    "modesetting" # 只使用集成显卡
    # "nvidia" # 使用 Nvidia 显卡
  ];

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.gnome.core-utilities.enable = false; # 最小化安装

  # -------------------- GNOME --------------------


  # -------------------- GNOME 应用 --------------------

  # 推荐 GNOME 应用
  environment.systemPackages = with pkgs; [
    gnome-console
    gnome.nautilus
    gnome-text-editor
    gnome.gnome-tweaks
    gnome.gnome-shell-extensions
    gnome.gnome-system-monitor
    gnome.gnome-disk-utility
    gnome.gnome-font-viewer
    gnome.gnome-characters
    gnome.eog
    gnome.file-roller
  ];

  # -------------------- GNOME 应用 --------------------


  # -------------------- 输入法 --------------------

  # Ibus 输入法，推荐 GNOME 使用
  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      libpinyin # 中文输入法
    ];
  };

  # -------------------- 输入法 --------------------
}