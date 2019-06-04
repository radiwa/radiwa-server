# frozen_string_literal: true

require 'bundler'
require 'yaml'

ENV['APP_ENV'] ||= 'development'

Bundler.require(:default, ENV['APP_ENV'])

# require_relative 'config/extensions/config'

Dir.glob('lib/tasks/*.rake').each { |r| load r }
