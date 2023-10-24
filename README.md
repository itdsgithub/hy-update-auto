# hy-update-auto
2023.10.22

利用chatgpt写的脚本代码，第一次写脚本代码，比较激动。

功能：检查github上hysteria2的内核版本，与本服务器上的版本对比，如果有新的，就更新。


手动版：
```shell
wget --content-disposition https://raw.githubusercontent.com/itdsgithub/hy-update-auto/main/hy-auto-update.sh && bash hy-auto-update.sh
```

半自动版：

好多人用的都是宝塔面板，把代码复制到宝塔“计划任务”里设置一下，选“shell”脚本，按天执行就行了。

全自动版：

不会
