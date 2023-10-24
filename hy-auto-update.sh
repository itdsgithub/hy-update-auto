#!/bin/bash

# GitHub 项目的信息
github_user="apernet"
github_repo="hysteria"
asset_name="hysteria-linux-amd64"
releases_url="https://api.github.com/repos/${github_user}/${github_repo}/releases/latest"

# 获取最新发布版本的信息
latest_release=$(curl -s "${releases_url}")
latest_version=$(echo "${latest_release}" | grep -o '"tag_name": "[^"]*' | cut -d'"' -f4 | cut -d'/' -f2)

# 获取当前已安装的版本号
current_version=$(hysteria version | awk '/Version:/ {print $2}')

# 输出当前版本号
echo "当前安装的版本号为：${current_version}"

# 比较版本号
if [[ "${latest_version}" != "${current_version}" ]]; then
    echo "发现新版本：${latest_version}"
    echo "正在下载最新版本的 hysteria-linux-amd64 文件..."

    # 获取最新版本的下载链接
    download_url=$(echo "${latest_release}" | grep -o '"browser_download_url": "[^"]*' | cut -d'"' -f4)

    # 下载最新版本的 hysteria-linux-amd64 文件
    wget -q -O "/usr/local/bin/${asset_name}.new" "${download_url}"

    # 替换当前版本的 hysteria 文件
    mv "/usr/local/bin/${asset_name}.new" "/usr/local/bin/${asset_name}"

    echo "已成功更新到版本 ${latest_version}"

    # 重启服务
    systemctl restart hysteria-server.service
    echo "已重启 hysteria-server 服务。"
else
    echo "当前已是最新版本，无需更新"
fi
