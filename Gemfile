source 'http://rubygems.org'

ruby '1.9.3'
gem 'rails', '3.2.3'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

group :development, :test do
  gem 'sqlite3'
  gem 'execjs'
  gem 'linecache19', :git => 'git://github.com/mark-moseley/linecache'
  gem 'ruby-debug-base19x', '~> 0.11.30.pre4'
  gem 'ruby-debug19'
  gem "rails-erd"

end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'less-rails'
  gem 'sass-rails', "  ~> 3.2.3"
  gem 'coffee-rails', "~> 3.2.1"
  gem 'uglifier'
  gem 'twitter-bootstrap-rails'
end

# gemfile
#http://devcenter.heroku.com/articles/how-do-i-use-sqlite3-for-development
gem 'therubyracer'
gem 'pg', :group => :production
gem 'panda', '1.5.0'
gem 'dynamic_form'
gem 'jquery-rails', '~> 2.3.0'

gem 'carrierwave'
gem 'fog', '~> 1.3.1'
gem 'rmagick'
gem 'acts-as-taggable-on', '~> 2.2.2'
gem 'inherited_resources' #For nested resources
gem 'split', require: 'split/dashboard'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'doorkeeper', '~> 0.6.7'
# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
