#!/bin/bash

# GitHub 项目的信息
github_user="apernet"
github_repo="hysteria"
asset_name="hysteria-linux-amd64"
releases_url="https://github.com/${github_user}/${github_repo}/releases/latest"

# 获取 GitHub releases 页面 URL
latest_version=$(curl -sI -w %{url_effective} -L -s "${releases_url}" -o /dev/null | awk -F '/' '{print $NF}')

# 获取当前已安装的版本号
current_version=$(hysteria version | awk '/Version:/ {print $2}')

# 输出当前版本号
echo "当前版本号为：${current_version}"

# 比较版本号
if [[ "${latest_version}" != "${current_version}" ]]; then
    # 下载最新版本的 hysteria-linux-amd64 文件
    wget -O "/usr/local/bin/${asset_name}.new" "${releases_url}/${asset_name}"

    # 替换当前版本的 hysteria 文件
    mv "/usr/local/bin/${asset_name}.new" "/usr/local/bin/${asset_name}"

    # 输出更新信息
    echo "已更新到版本 ${latest_version}"
else
    # 输出取消信息
    echo "无需更新，当前已是最新版本"
fi
