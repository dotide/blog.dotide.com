---
title: Jobs for Hackers
date: 2013-09-05
author: Michael Ding
tags:
- 工作
---


我们是个崇尚黑客文化的科技初创团队。我们相信`Smart is the new sexy!`

我们爱折腾爱探索；追求简单，高效和智慧。

如果你也认同，那还犹豫什么？给我们发邮件吧:-D

```ruby
source 'http://dotide.com'

ruby '2.0.0'

group :backend do
  gem 'rails', '4.0.0'
  gem 'grape'
  gem 'mongoid'
  gem 'redis'
end

group :frontend do
  gem 'haml'
  gem 'coffee-rails'
  gem 'sass-rails'
  gem 'jquery-rails'
  gem 'zurb-foundation'
  gem 'rails-backbone'
end

group :test do
  gem 'rspec'
end

group :bonus do
  editor %w(Vim Emacs Sublime)
  os %w(Linux Mac)
  scm 'git'
  security %w(Injection XSS CSRF)
  ops
  fuckgfw
  account %w(GitHub StackOverflow SegmentFault)
  blog
end

# mailto:jobs@dotide.com
```
