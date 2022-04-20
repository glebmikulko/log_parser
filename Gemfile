source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'require_all', '~> 3.0.0'

group :development do
  # styleguides
  gem 'rubocop', '~> 1.27', require: false
  gem 'reek', '~> 6.1.0', require: false
end

group :test do
  gem 'rspec', '~> 3.11'
  gem 'rspec-file_fixtures', '~> 0.1.6'
end