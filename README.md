# hy-update-auto
2023.10.22

利用chatgpt写的脚本代码，第一次写脚本代码，比较激动。

功能：hysteria的内核文件每天自动检查新版本并更新。
```shell
wget --content-disposition https://raw.githubusercontent.com/itdsgithub/hy-update-auto/main/hy-auto-update.sh && bash hy-auto-update.sh
```

说明：

1、用自己hysteria的版本和Releases上发布的版本对比，如果有更新，那就更新并替换，否则不替换。

2、对比完后提示是否添加每天任务，如果是，自动添加任务以后凌晨3点自动对比后更新。如果否，以前添加过的任务也会删掉。

3、其实如果用宝塔面板，可以把前面对比更新的代码复制到宝塔“计划更新”里，都一样。
