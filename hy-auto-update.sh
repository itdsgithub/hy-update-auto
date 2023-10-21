#!/bin/bash

# GitHub 项目的信息
github_user="apernet"
github_repo="hysteria"
asset_name="hysteria-linux-amd64"
releases_url="https://github.com/${github_user}/${github_repo}/releases/latest"

# 获取 GitHub releases页面
latest_version=$(curl -sI -w %{url_effective} -L -s ${releases_url} -o /dev/null | sed 's/\#.*//')

# 提取版本号部分
latest_version=$(basename $latest_version)

# 获取当前已安装的版本号
current_version=$(hysteria version | grep -E "Version:" | awk '{print $2}')

# 输出当前版本号
echo "目前版本号为: ${current_version}"

# 比较版本号
if [ "${latest_version}" != "${current_version}" ]; then
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

# 读取用户输入
read -p "是否设置每日定时更新任务？ (y/n): " set_update

if [ "$set_update" == "y" ]; then
    # 设置每日定时更新任务 (凌晨3点)
    (crontab -l ; echo "0 3 * * * /usr/bin/bash -c 'latest_version=\$(curl -sI -w %{url_effective} -L -s ${releases_url} -o /dev/null | sed 's/#.*//'); latest_version=\$(basename \$latest_version); current_version=\$(hysteria version | grep -E \"Version:\" | awk '{print \$2}'); if [ \"\$latest_version\" != \"\$current_version\" ]; then wget -O \"/usr/local/bin/${asset_name}.new\" \"${releases_url}/${asset_name}\"; mv \"/usr/local/bin/${asset_name}.new\" \"/usr/local/bin/${asset_name}\"; fi'") | crontab -
    
    # 输出设置信息
    echo "已设置每日定时更新任务"
elif [ "$set_update" == "n" ]; then
    # 删除每日定时更新任务
    crontab -l | grep -v "0 3 * * * /usr/bin/bash -c 'latest_version=\$(curl -sI -w %{url_effective} -L -s ${releases_url} -o /dev/null | sed 's/#.*//'); latest_version=\$(basename \$latest_version); current_version=\$(hysteria version | grep -E \"Version:\" | awk '{print \$2}'); if [ \"\$latest_version\" != \"\$current_version\" ]; then wget -O \"/usr/local/bin/${asset_name}.new\" \"${releases_url}/${asset_name}\"; mv \"/usr/local/bin/${asset_name}.new\" \"/usr/local/bin/${asset_name}\"; fi'" | crontab -
    
    # 输出取消信息
    echo "已取消每日定时更新任务"
fi
