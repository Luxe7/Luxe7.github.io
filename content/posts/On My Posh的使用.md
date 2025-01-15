---

title: 使用 On My Posh 美化 Terminal

date: 2024-03-02

description: 如何将黑黑的或蓝蓝的 Terminal 变为自己喜欢的样子

header_img: 

short: 

math: 

tags:
  - Windows
  - SoftWare

---
>本文基于Windows 11 Professional 22H2，低于这个版本的Windows可能需要对Terminal进行额外的更新操作


## 前言

在用[Helix](https://helix-editor.com/)的时候，突然感觉Windows的终端看起来有点emm..所以就想改变一下外观  

[On My Posh](https://ohmyposh.dev/)是一款全平台终端提示符个性化工具，简要地讲，它可以让你的终端（那个黑框框，或者蓝框框）变得稍微好看一点

## 配置

### 下载与安装

*（建议使用网络工具进行以下操作）*  

方法一：使用`winget`进行安装  

Windows一直缺乏一个完善的官方包管理系统，微软商店也因为一些众所周知的原因不是很好用，不过2020年微软推出了`winget`，也算是填补了这一点


使用Power Shell 运行以下命令安装Oh My Posh 

```powershell

winget install JanDeDobbeleer.OhMyPosh -s winget

```

方法二：进入微软商店搜索On My Posh进行下载


然后下载作者推荐的[MesloLGM NF字体](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip)，下载后解压，全选右键点击安装即可自动安装

### 进行配置

在Terminal中按`ctrl + ,`打开配置文件，点击左下角打开JSON文件，找到`profiles-defaults`，修改为如下代码：

```JSON

"defaults": {

            "colorScheme": "Campbell", //颜色方案

            "font": {

                "face": "MesloLGM NF" //字体

            },

            "opacity": 100 //不透明度

        },

```

新建Terminal，输入`notepad $profile`使用笔记本打开配置文件，输入以下配置信息，并保存

```text

 [System.Console]::OutputEncoding=[System.Text.Encoding]::GetEncoding(65001) # 配置默认编码

 oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\material.omp.json" | Invoke-Expression # 配置oh-my-posh的theme

```

完成后新建Terminal即可看到焕然一新的终端

### 修改主题

在[On My Posh](https://ohmyposh.dev/)官网查看主题介绍，找到自己喜欢的主题`yyy`  

输入`notepad $profile`使用笔记本打开配置文件，将`xxx.omp.json`替换为`yyy.omp.json`，打开一个新终端即可看到新主题

## 可能遇到的问题

### 配置VSCode中的终端

进入VSCode，按下`ctrl + ,`打开设置  

找到`Features > Terminal › Integrated › Default Profile: Windows`设置，设置为`Power Shell`  

重启VSCode后新建终端查看效果

### 无法显示conda环境

这个问题是因为主题文件中`segments`中`type`为`python`部分没有配置或默认配置为`false`  

手动修改为自己喜欢的样式即可，可参考[这个帖子](https://stackoverflow.com/questions/75718484/how-can-i-see-conda-env-in-oh-my-posh-theme-in-powershell)，评论区也给出了相关的官方文档  


可参考：

```JSON

{

	"type": "python",

	"style": "plain",

	"foreground": "#98C379",

	"properties": {

		"display_virtual_env": true,

		"dispplay_default": true,

		"display_version": false,

		"prefix": "\uE235 ",

		"postfix": " ",

		"display_mode": "always"

	}

}

```

或：

```JSON

{

          "foreground": "yellow",

          "properties": {

            "fetch_version": true,

            "fetch_virtual_env": true,

            "display_mode": "files",

            "home_enabled": true,

            "display_default": true

          },

          "style": "plain",

          "template": "[\ue235 {{ if .Error }}{{ .Error }}{{ else }}{{ if .Venv }}{{ .Venv }}{{ end }}{{ .Full }}{{ end }}]",

          "type": "python"

        }

```

## 总结

On My Posh可自定义范围非常广，如果你有时间，完全可以将终端设置成自己想要的样子，但一般情况下主题也就够用了