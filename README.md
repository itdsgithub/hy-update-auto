# hy-update-auto
2023.10.22

利用chatgpt写的脚本代码，第一次写脚本代码，比较激动。

功能：检查github上hysteria2的内核版本，与本服务器上的版本对比，如果有新的，就更新。
```shell
wget --content-disposition https://raw.githubusercontent.com/itdsgithub/hy-update-auto/main/hy-auto-update.sh && bash hy-auto-update.sh
```

其他：

好多人用的都是宝塔面板，把代码复制到宝塔“计划任务”里设置一下，按天执行就行了。
