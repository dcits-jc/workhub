source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development







# plugins
# 加载jquery
gem 'jquery-rails'
# bootstrap样式集
gem 'bootstrap-sass'
# 图标库
gem 'font-awesome-sass', '~> 4.7.0'
# 智能表单
gem "simple_form"
# 断点器
gem 'pry'
# 用户系统
gem "devise"
# model提示
gem 'annotate'
# 状态机
gem 'aasm'
# 密码管理
gem 'figaro'


# 添加rails国际化支持
gem 'rails-i18n', '~> 5.0.0'
# 添加 devise 的国际化支持
gem 'devise-i18n'


# develop plugins
# 数据图生成器
gem "rails-erd"
# console美化器
gem "awesome_rails_console"


# 搜索下拉菜单
gem 'bootstrap-select-rails'

# 文件上传
gem 'carrierwave'

# 头像生成
gem 'dragonfly', '~> 1.1.4'
gem 'avatar_magick'

# 拼音
gem 'chinese_pinyin'

# 搜索模块
gem 'ransack'
# 分页
gem 'will_paginate'
# 时间选择模块
gem 'flatpickr_rails'
# 编辑器
gem 'simditor'

# markdown
gem 'markdown-rails', '~> 0.2.1'


# 七牛插件
gem 'carrierwave-qiniu', '~> 1.1.5'
gem 'qiniu-rs'
gem 'qiniu', '>= 6.9.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'sqlite3'

end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem "capistrano", "~> 3.4"
  gem "capistrano-rvm"
  gem "capistrano-rails"
  gem "capistrano-passenger"
end


group :production do
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
