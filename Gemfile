source 'https://rubygems.org'

ruby '~> 2.6.1'

gem 'sinatra'
gem 'sequel'
gem 'oj'

gem 'sqlite3'

gem 'rack'
gem 'rake'

gem 'dry-inflector'

gem 'require_all'

gem 'bcrypt'

# gem 'nats-pure'

gem 'jsonapi-parser'
gem 'jsonapi-renderer'
gem 'jsonapi-serializable'
gem 'jsonapi-deserializable'

gem 'puma'

group :staging, :production do
  gem 'rollbar'
end

group :development, :test do
  gem 'rspec'
  gem 'ffaker'
end

group :development do
  gem 'shotgun'
  gem 'pry'

  gem 'reek'
  gem 'rubocop'
end
