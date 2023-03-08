# NixOS 配置文件

<a href="https://nixos.org/manual/nixos/stable/"><img alt="NixOS version" src="https://img.shields.io/badge/NixOS-22.11-blue?style=flat-square"></a>
<a href="LICENSE"><img alt="LICENSE" src="https://img.shields.io/github/license/yuhext/nixos-config?style=flat-square"></a>

NixOS 基础配置文件，包含各种桌面环境

## 详情

- NixOS 版本：22.11
- 桌面环境：GNOME、KDE Plasma、Xfce
- 分区方案：GPT + UEFI
- 引导选项：GRUB2 + systemd
- 测试机器：Intel i5 8300H + Nvidia GTX 1050Ti

## 注意事项

具体安装步骤可以参考 [官方教程](https://nixos.org/manual/nixos/stable/index.html#nixos-manual) 和 [我的博客](https://blog.csdn.net/yuhext/article/details/129349895)，下面只说明使用此仓库配置需要注意的点

### EFI 系统分区

EFI 系统分区 (ESP) 挂载点为 `/efi` (对应配置文件中的 `efiSysMountPoint`)，优于挂载在 `/boot/efi` 上。

参考硬盘分区如下：

| 挂载点 | 分区 | 分区类型 |
| :--- | :--- | :--- |
| /efi | /dev/sda1 | ESP |
| / | /dev/sda2 | 根分区 |
| /home | /dev/sda3 | 用户分区 |
| swap | /dev/sda4 | 交换分区 (可选) |

- 交换分区可以用交换文件代替

### 硬件设置

所有配置位于 `/mnt/etc/nixos` 目录下 (`/mnt` 挂载根目录)，不要更改 `handware-configuration.nix` (硬件配置) 中的内容，这是根据你的机器自己生成的，其中内容可以由其他配置文件覆盖

### 软件源

NixOS 的软件源 `https://cache.nixos.org` 在国内无法访问，所以在安装时需要设置代理：

```bash
# 设置代理
export http_proxy="socks://192.168.2.165:10810"
export https_proxy="socks://192.168.2.165:10810"

# 安装系统
nixos-install
```

也可以使用镜像源安装，但是有概率会安装失败

```bash
# 使用北京外国语大学的镜像源
nixos-install --option substituters "https://mirrors.bfsu.edu.cn/nix-channels/store"
```

## 使用许可

[MIT](LICENSE) © Yuhext