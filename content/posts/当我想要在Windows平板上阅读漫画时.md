+++  

title = "当我想要在 Windows 平板上阅读漫画时"  

subtitle = ""  

date = 2024-10-20  

description = "在 Surface 上折腾本地漫画阅读"  

short = true  

math = false  

tags=["Windows","MicroSoft"]  

series = [""]  

toc = true  

+++  

## 被物欲控制  

这个时代，到处都是广告，可能是街头巷尾的海量宣传，也可能是隐藏在各大社交平台的隐形广告  

之前有一段时间，老是给我推送电纸书的视频，也是看了很久，了解了很多，关于墨水屏的技术；各大国产厂商文石，掌阅的产品，也了解了一些海外厂商，亚马逊的 Kindle，kobo 等等  

我个人的需求大概是既可以使用微信读书，也可以看我本地下载的漫画，所以想要一台8寸左右的电纸书  

这个时候，我又刷到了很多 IPad 的视频，我又觉得平板确实是电纸书的上位替代，因为它的功能是电纸书的超集（除了护眼），而且我可能真的需要尝试一下无纸化学习（真的吗），于是我又了解了很多 IPad 产品线的信息，差点就下单 IPad Pro 了  

有一天晚上躺在床上想起《搏击俱乐部》，于是下定决心克制物欲，遂放弃购买新的电子产品，尽量减少花在社交平台上的时间，远离诱惑，这时候想起有一台闲置的 Surface 平板，于是开始折腾  

## 开始折腾  

关于 PC 端的微信阅读，我之前已经解决了，感兴趣可以阅读[这篇博客](https://luxe7.icu/posts/pc%E5%BE%AE%E4%BF%A1%E8%AF%BB%E4%B9%A6%E6%9C%80%E4%BD%B3%E5%AE%9E%E8%B7%B5/)  

所以主要需要解决的问题是如何在 PC 端阅读漫画  

### YACReader  

YACReader 是一个开源的多平台本地漫画阅读器，我先是在 PC 上安装了这个软件，一开始是非常开心的，因为基本上满足我的所有阅读需求，而且非常流畅，但是当我将它放在 Surface 上开始全屏阅读时，发现它并不能支持触屏，这让我很意外  

我一开始的解决思路是，设置快捷键，看能不能设置音量键翻页或者映射触屏，音量键翻页手感不佳且会唤出音量修改界面，至于映射触屏好像无法做到  

于是开始寻找解决方案，幸运的是 YACReader 官网有一个讨论论坛，不幸的是，我发现早在将近八年前就反馈了[这个问题](https://www.yacreader.com/forum/support-windows/998-windows-10-touch-version-please)，而且这个帖子的互动也暴露了开源社区常见的问题：开源开发者的时间有限，为爱发电实属不易  

这个帖子的评论区有使用者给出了解决办法，比如设置简单的操作逻辑，也有人给出了微软触屏组件的 API，但是  
>开发者表示："It is an open source project, why don't you add touch support yourself? It is a task fairly easy to do."  
>有使用者表示："If it's a such an easy task why does the original developer not add it himself......"  
>开发者比较强硬地回应："I am the developer. YACReader is a side project, it is free and my time is limited, that's why some times I can't tackle some tasks/features. This is a thing that it is in my TODO list so IT IS going to happen...  Again, I don't see a reason for not doing it yourself and open a PR, damn, it is even hacktoberfest season, you could get a tshirt and all."  

说实话，这两方的意见都没有错误，我都可以理解  

随后，我又在 Windows 板块下看到了一个一周前发送的帖子，[How to change page using a touchscreen](https://www.yacreader.com/forum/support-windows/2624-how-to-change-page-using-a-touchscreen)，也就是说这个问题其实已经持续了至少七年半，同时也看得出来用 Windows 平板的群体很小，用它来看漫画的人就更少了  

如果我擅长 CPP 开发，真的就打算自己做这个功能了，可惜我并不擅长，遂尝试选择其他应用  

### 该死的微软商店  

我查询资料发现，微软商店上有一些评价比较好的本地漫画阅读器，比如 cover，漫画阅读器 UWP 等等，遂尝试  

但是我的两台 Windows 设备都禁止了检查更新，同时也禁止了一些微软组件联网，这也导致我没有办法正常使用微软商店，遂尝试侧载  

侧载的大概思路是，下载对应的 Msixbundle 或 AppxBundle 文件直接安装，拿到软件的商店链接后可以去[这里](https://link.zhihu.com/?target=https%3A//store.rg-adguard.net/)使用，同时我也找到了一些开发者封装好的下载和管理软件，这里不再展开  

侧载后，也许是因为我禁用了网络，软件卡在启动页，一段时间后自己关闭，猜测是需要借用微软商店的组件验证等，具体原因不明，遂放弃  

### 图片阅读器  

我之前其实没有阅读电子漫画的习惯，看到有人推荐说，下载漫画最优选是选择图片格式，那我就想，为什么不可以直接使用图片阅读器呢？  

于是选择以轻量化著称的 BandiView，在 Surface 上试用了一下，可以通过触屏切换下一页，并且可以记录上次阅读的位置，基本满足需求，圆满解决  

## 题外话：漫画安利  

《剑风传奇》，从1989年开始连载，作者已经过世，也许是我看过最黑暗，深刻，残忍的作品，一开始是被 Kentaro Miura 的伟大画工震撼，随后被整个作品俄狄浦斯式的悲剧所吸引，主角的超人意志力让我想到《战锤40K》的帝国之拳原体 Rogal Dorn  

《浪客行》，从1998开始连载，作者井上雄彦（对，也是灌篮高手的作者）讲一个武士的故事，我个人曾经看过几部有名的剑戟片，但是要提到武士，我首先想到的还是这部漫画