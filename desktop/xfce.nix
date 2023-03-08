{ config, pkgs, ... }:

{
  # -------------------- Xfce --------------------

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

  services.xserver.displayManager.defaultSession = "xfce";
  services.xserver.desktopManager = {
    xterm.enable = false;
    xfce.enable = true;
  };

  # -------------------- Xfce --------------------


  # -------------------- Xfce 应用 --------------------

  # 推荐 Xfce 应用
  environment.systemPackages = with pkgs; [
    xfce.xfce4-settings
    xfce.xfce4-panel
    xfce.xfdesktop
    xfce.thunar
    xfce.xfce4-terminal
    xfce.xfce4-appfinder
    xfce.mousepad
    xfce.ristretto
  ];

  # -------------------- Xfce 应用 --------------------


  # -------------------- 输入法 --------------------

  # Fcitx5 输入法，推荐 Xfce 使用
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-chinese-addons # 中文输入法
    ];
  };

  # -------------------- 输入法 --------------------
}