#!/usr/bin/env bash
# 更新桌面配置：nvfetcher 拉最新来源 → git add → home-manager switch → 刷新 KDE 菜单
set -euo pipefail

# 切到仓库根（flake.nix / nvfetcher.toml 所在）
cd "$(dirname "${BASH_SOURCE[0]}")/.."

echo "==> 1/4 nvfetcher 更新来源"
nvfetcher

echo "==> 2/4 git add _sources（flake 只看 git tracked 文件，否则 build 报 path not exist）"
git add _sources

echo "==> 3/4 home-manager switch"
nix run home-manager -- switch --flake .#cambricon-desktop

echo "==> 4/4 刷新 KDE 菜单缓存"
kbuildsycoca6

echo "==> 完成。改动已 staged，review 后请 git commit。"
