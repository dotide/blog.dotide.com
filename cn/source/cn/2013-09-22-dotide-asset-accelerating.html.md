---
title: Dotide主站的静态资源是如何加速的？
date: 2013-09-22
author: Hemslo Wang
tags:
- 技术tech
---

Dotide的主站是用Ruby on Rails开发的，在对静态资源的处理中使用了[Asset Pipeline]，对多个CSS和JavaScript文件进行组合、压缩，从而大大减少了浏览器的并发连接数量与静态文件体积。

在部署到生产环境时，我们使用了[Capistrano]进行自动化部署，因为我们的ruby环境是使用RVM进行配置的，所以在Gemfile里还要加上`gem 'rvm-capistrano'`。Capistrano的脚本中已经自带了对Asset Pipeline的支持，只需要解除Capfile中`load 'deploy/assets'`的注释即可。

在生产环境中，静态资源是由web server（如nginx）处理的，而不是app server（如unicorn），在部署时所有的静态资源会被precompile到public目录中，所以要在web server中将public目录设置为网站根目录。同时要开启gzip压缩，大幅减少网络传输文件的大小。

nginx配置gzip如下：

```
gzip_static      on;
gzip  on;
gzip_min_length  1k;
gzip_disable "MSIE [1-6]\.";
gzip_buffers     16 8k;
gzip_types       text/plain text/css text/javascript application/javascript application/xml;
```

为了使不同地区的用户都能获得最佳的访问速度，我们使用了[七牛云存储]的[镜像存储]功能进行加速。该功能对开发者极为友好，不需要写同步脚本或者ftp上传(想主动上传也可以用[qrsync])，只需要在七牛后台配置一下源站。并在rails的配置文件中设置一下`config.action_controller.asset_host = "http://dotide-cdn.qiniudn.com"`即可。之后所有的静态资源都会通过七牛的服务器进行分发，大大减轻了我们主站服务器的压力，节约了带宽。

总结一下，三个要点：

1. 减少文件数量
2. 缩小传输文件体积
3. 使用CDN

以上便是Dotide主站关于加速静态资源的一些经验。

[Asset Pipeline]: http://guides.rubyonrails.org/asset_pipeline.html
[Capistrano]: http://www.capistranorb.com/
[七牛云存储]: http://www.qiniu.com/
[镜像存储]: http://blog.qiniudn.com/morrior-storage.md.html
[qrsync]: http://docs.qiniu.com/tools/v6/qrsync.html
