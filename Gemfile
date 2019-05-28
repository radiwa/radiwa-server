source 'https://rubygems.org'

ruby '~> 2.6.1'

gem 'sinatra'
gem 'sequel'
gem 'oj'

# gem 'nats-pure'

gem 'jsonapi-parser'
gem 'jsonapi-renderer'
gem 'jsonapi-serializable'
gem 'jsonapi-deserializable'

group :production, :staging do
  gem 'puma'
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
