# hy-update-auto
利用chatgpt写的脚本代码，第一次写脚本代码，比较激动。
功能：hysteria的核心文件每天自动检查新版本并更新。
```shell
wget --content-disposition https://raw.githubusercontent.com/itdsgithub/hy-update-auto/main/hy-auto-update.sh && hy-auto-update.sh
```

说明：
1、对比hysteria的版本，如果realse上发布的版本新，那就更新并替换，但是只是针对小破站那个脚本做的。
2、对比完后提示是否添加每天任务，以后凌晨3点自动更新对比。
