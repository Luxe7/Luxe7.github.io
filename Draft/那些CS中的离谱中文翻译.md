---
title: 那些CS中的离谱中文翻译
date: 2024-04-01
description: 
header_img: 
short: 
math: 
tags:
---
起源是我在看一个Web框架的源码的时候，我看到有人说，路由树中句柄数越多的分支，要使之越容易被匹配到，这个地方的句柄真一下子给我搞懵了，突然想不起来这是什么意思了

在知乎看到[黄兢成](https://www.zhihu.com/people/huang-jing-cheng)大佬的回答，才明白来龙去脉：
句柄这个翻译有点奇怪。据维基百科，句柄 的条目。
David Gries所著的《Compiler Construction for Digital Computer》（1971）有句话
> A handle of any sentential form is a leftmost simple phrase.

该书中译本，《数字计算机的编译程序构造》(仲萃豪译, 1976 版）翻译成

> 任一句型的句柄就是此句型的最左简单短语。

这可能是句柄一词最早的出处。
这里确实是在讨论句子。在这里句柄是个意译的合成词，两个字分拆开，“句柄”中的“柄”，用法就类似于，“刀柄”中的“柄”。用在此处是适当的。
但以后将各种资源 handle, 都翻译成句柄时，就有点滥用了。



计算机领域很多英文词，直接从日常词中引申而来。比如 fork，日常用词就是个叉子，在 unix 中引申成创建新进程（进程分叉了）。[socket](https://www.zhihu.com/search?q=socket&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A943130123%7D) 日常用词是插座（连起来用于通电），引申成联网的标记信息（连起来用于通信）。英文是很日常，很容易理解的词，有时翻译成中文反而难以理解了。

