# AGENTS.md

基于 Nix flake 的 home-manager 配置仓库。

## 环境准备

```sh
# 安装 Nix 包管理器
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
# 启用 flake 和新版 nix 命令
echo 'experimental-features = nix-command flakes' >> /etc/nix/nix.conf
# 设置 root 用户环境变量（home-manager 配置以此用户运行）
echo 'export USER=root' >> ~/.bashrc
echo 'export HOME=/root' >> ~/.bashrc
```

## 命令

```sh
nix fmt .                        # 格式化所有 Nix 文件（使用 alejandra）
nix run home-manager -- switch --flake .#cambricon-pod      # 应用配置（root，最小集）
nix run home-manager -- switch --flake .#cambricon-dev      # 应用配置（root，开发工具链）
nix run home-manager -- switch --flake .#cambricon-desktop  # 应用配置（cambricon，桌面）
```

## 架构

```
flake.nix                   — 入口文件，定义 inputs 和三个 homeConfiguration
home/cambricon-pod.nix      — root（/root），最小集
home/cambricon-dev.nix      — root（/root），开发工具链（rust/llvm/js）
home/cambricon-desktop.nix  — cambricon（/home/cambricon/），桌面（fonts/fcitx5/ghostty）
home/packages/              — 各工具模块，按需由上述配置导入
```

- 系统硬编码为 `x86_64-linux`。
- 导入 nixpkgs 时设置了 `allowUnfree = true`。
- 三套配置共用基础包（basic/git/neovim/nushell/yazi）；dev 额外导入 rust/llvm/js，desktop 额外导入 fonts/fcitx5/ghostty。
- 用户与家目录随配置而异：pod/dev 为 root(/root)，desktop 为 cambricon(/home/cambricon/)。

## 模块约定

- 新增的软件包应以独立的 `.nix` 文件放在 `home/packages/` 目录下，并在需要的 `home/cambricon-*.nix` 中导入。
- Neovim 配置从外部仓库拉取（`418-teapot/NeoDot`，commit 固定于 `neovim.nix` 中）。同步上游变更时需更新 rev hash。

## 提交风格

使用 Conventional Commits，带 scope：`feat(NixDot):`、`fix(config):`、`refactor(NixDot):` 等。
