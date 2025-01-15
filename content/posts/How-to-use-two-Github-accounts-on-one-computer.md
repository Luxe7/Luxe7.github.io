---
title: 如何在一台电脑上使用两个Github账号
date: 2023-10-28
description: 设置远程仓库时使用不同的 Host 名称，查找`~/.ssh/config`文件，使用不同的 SSH 文件连接到 GitHub
header_img: 
math: 
tags:
  - Git
---

## 原因

很简单，两个账号的用途不一样，不想让两个账号的TimeLine互相污染  

理论上来说可以每次手动删除本地的SSH信息，然后切换账号，但这样做有很多缺点： 

1. 需要很多人工操作 
2. 如果遇到需要两个账号交替提交代码的情况就会非常折磨		


于是就有了这篇文章

## 原理

我一开始的打算是生成两个SSH密钥，然后手动配置不同repo中的账户信息，但实际上Github只会默认找到一个固定的SSH进行连接


SSH密钥决定了用户是否有权限访问一个GitHub账号下的repo，本地repo的设置决定了GitHub中commit记录的用户，Github只连接一个固定的SSH决定了我们在正常情况下只能用一个账号


所以问题的核心在于，**如何让GitHub基于某种条件，连接不同的SSH，而这个条件对于我们来说是可控的**

## 实际操作

### 生成密钥

根据两个账号的信息，生成两对密钥  

按照自己的命名规则，放置在`~/.ssh`路径下  

分别将这两对密钥加入到对应的 GitHub 账户中


### 编辑配置

编辑`~/.ssh/config`文件，若无则新建  

（Host名称和id_rsa_one和id_rsa_two名称自定义即可）

```text

# First

Host github_one

Hostname ssh.github.com

IdentityFile ~/.ssh/id_rsa_one


# Second

Host github_two

Hostname ssh.github.com

IdentityFile ~/.ssh/id_rsa_two

```

修改配置后在终端使用如下命令检查配置是否正确

```

ssh -T git@github_one

ssh -T git@github_two

```

若返回`Hi xxx! You've successfully authenticated, but GitHub does not provide shell access.`则配置成功

### 配置repo

之后只需要在添加远程仓库的时候，使用自己设置的Host即可，如：

````text

git remote add origin git@github_one:xxx/xxx.git

````

实际上就是设置远程仓库时使用不同的 Host 名称，查找`~/.ssh/config`文件，使用不同的 SSH 文件连接到 GitHub


创建仓库后，修改本repo用户信息即可

```

git config --local user.name xxx

git config --local user.email xxx

```

