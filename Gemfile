source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.4'
gem 'rails', '~> 5.2.1'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap', '~> 4.1.3'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jbuilder', '~> 2.5'
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'bcrypt'
gem 'rails-i18n'
gem 'carrierwave'
gem 'mini_magick', '4.7.0'
gem 'rmagick'
gem 'rails-ujs'
gem 'ransack'
gem 'will_paginate'
gem 'bootstrap-will_paginate'




group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'sqlite3'
  gem 'win32console'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen',                '3.1.5'
  gem 'spring',                '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
  gem "better_errors"
  gem "binding_of_caller"
end


group :test do
  gem 'rails-controller-testing', '1.0.2'
  gem 'minitest',                 '5.11.3'
  gem 'minitest-reporters',       '1.1.14'
  gem 'guard',                    '2.13.0'
  gem 'guard-minitest',           '2.4.4'
  
end

group :production do
  gem 'pg'
  gem 'fog',  '1.42'
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]