{ config, pkgs, ... }:

{
  imports =
    [
      # 选择需要的组件

      # 硬件设置
      ./hardware-configuration.nix

      # 桌面环境
      ./desktop/gnome.nix # GNOME
      # ./desktop/kde.nix # KDE Plasma
      # ./desktop/xfce.nix # Xfce

      # 程序设置
      ./programs/fish.nix # Fish
      # ./programs/zsh.nix # Zsh
    ];


  # -------------------- 引导程序 --------------------

  # 使用 GRUB2 EFI 引导程序
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/efi"; # EFI 挂载点
    };

    grub = {
      enable = true;
      version = 2;
      device = "nodev";
      efiSupport = true;
      useOSProber = true; # 探测其他操作系统
    };
  };

  # 启动设置
  boot = {
    # Linux 内核
    kernelPackages = pkgs.linuxKernel.packages.linux_5_15; # 最新 LTS 内核

    # 静默启动
    kernelParams = [
      # 内核参数
      "quiet"
      "udev.log_level=3"
      # "nomodeset" # 无法启动图形界面时使用
    ];
    consoleLogLevel = 3;
    initrd.verbose = false;
    plymouth.enable = true;

    # 支持的文件系统
    supportedFilesystems = [ "btrfs" "ntfs" ];
  };

  # -------------------- 引导程序 --------------------


  # -------------------- 网络设置 --------------------

  # 主机名
  networking.hostName = "Selene"; # 自行修改

  # 时区
  time.timeZone = "Asia/Shanghai";

  # 使用 NetworkManager 连接网络
  networking.networkmanager.enable = true;

  # 设置代理
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # NixOS 国内镜像源
  nix.settings.substituters = [
    "https://mirrors.bfsu.edu.cn/nix-channels/store" # 北京外国语大学镜像源
    # "https://mirror.sjtu.edu.cn/nix-channels/store" # 上海交通大学镜像源
    # "https://mirrors.ustc.edu.cn/nix-channels/store" # 中国科学技术大学镜像源
  ];

  # -------------------- 网络设置 --------------------


  # -------------------- 区域设置 --------------------

  # 系统语言
  i18n = {
    defaultLocale = "zh_CN.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "zh_CN.UTF-8/UTF-8"
    ];
  };

  # 终端设置
  console = {
    font = "liberation-fonts";
    keyMap = "us";
  };

  # 中文字体
  fonts = {
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
    ];
  };

  # -------------------- 区域设置 --------------------


  # -------------------- 用户设置 --------------------

  users.users.yuhext = { # 设置用户名为 yuhext，自行修改
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # 为普通用户开启 sudo
    packages = with pkgs; [ # 用户预置软件
      firefox
      # google-chrome
      # vlc
      # gimp
    ];
  };

  # -------------------- 用户设置 --------------------


  # -------------------- 服务设置 --------------------

  # 开启声音
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # 打印机设置
  # services.printing.enable = true;

  # 启用 OpenSSH
  services.openssh = {
    enable = true;
    ports = [ 22 ];
  };

  # 开放防火墙端口
  networking.firewall.allowedTCPPorts = [ 22 ];
  networking.firewall.allowedUDPPorts = [ 22 ];

  # 关闭防火墙
  # networking.firewall.enable = false;

  # -------------------- 服务设置 --------------------


  # -------------------- 软件包设置 --------------------

  # 系统预置软件
  environment.systemPackages = with pkgs; [
    wget
    curl
    git
    man
  ];

  # 软件许可证设置
  nixpkgs.config.allowUnfree = true; # 允许非自由软件

  # -------------------- 软件包设置 --------------------


  # -------------------- 杂项 --------------------

  # 备份系统设置
  system.copySystemConfiguration = true;

  # 系统版本
  system.stateVersion = "22.11";

  # -------------------- 杂项 --------------------
}