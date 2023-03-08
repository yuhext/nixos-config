{ config, pkgs, ... }:

{
  # -------------------- KDE Plasma --------------------

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

  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.desktopManager.plasma5.runUsingSystemd = true;

  # -------------------- KDE Plasma --------------------


  # -------------------- KDE 应用 --------------------

  # 推荐 KDE 应用
  environment.systemPackages = with pkgs; [
    libsForQt5.konsole
    libsForQt5.dolphin
    libsForQt5.plasma-vault
    libsForQt5.plasma-disks
    libsForQt5.ark
    libsForQt5.gwenview
  ];

  # -------------------- KDE 应用 --------------------


  # -------------------- 输入法 --------------------

  # Fcitx5 输入法，推荐 KDE Plasma 使用
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-chinese-addons # 中文输入法
    ];
  };

  # -------------------- 输入法 --------------------
}