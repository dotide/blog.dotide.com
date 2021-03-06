---
title: Dotide的纯静态官方博客是如何构建的?
date: 2013-09-18
author: Michael Ding
tags:
- 技术
---

也许你觉得 Dotide 的博客系统还不错，Dotide 的博客系统是通过合理的利用静态网站生成器，云存储以及第三方评论系统搭建起来的纯静态博客站点。是的，纯静态的！

首先，Dotide 博客的源码基于[Middleman](http://middlemanapp.com/)构建。Middleman 是一个很不错的“静态页面生成器”，用 Ruby 开发。
支持 erb,haml,markdown 等摸板引擎，有 layout 系统，可以设置变量。如果装上特定插件，比如说 blog 插件，还可以轻松地引入博客特性，比如归档、标签等。
总而言之，除了和用户的交互，Middleman 完全可以胜任一切“展示性”的工作。

然后，对于和用户的交互，我们可以通过[多说](http://duoshuo.com/)这样的第三方评论系统实现。
得益于"多说"，我们可以在不需要任何后台，将博客系统"纯静态化"的同时，保持和用户的沟通。

最后，关于静态网站的部署，我们选用了国内做得很出色的 CDN 服务商[又拍云](https://www.upyun.com/)。
又拍云提供第三方域名的绑定。这样，只要我们的域名在国内备案，就可以通过 CNAME 的设置，将二级域名映射到又拍云的 CDN 上。
而 CDN 本身的诸多访问优势则让我们的服务更加优质。

Dotide 博客是开放源代码的，所有源码均托管在[Github](https://github.com/dotide/blog.dotide.com)。
