ruby '2.4.1'
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '~> 5.2.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'

gem "jwt"
gem "bcrypt", "~> 3.1.7"
gem "rack-cors"

gem 'send_file_with_range', git: 'https://github.com/tom-sherman/send_file_with_range.git', branch: 'buffer-size'
gem 'acts-as-taggable-on', '~> 6.0'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development do
	gem 'dotenv-rails'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
	gem 'pry'
	gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :test do
  gem 'minitest'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
