# frozen_string_literal: true

require 'yaml'
require 'json'
require 'digest'
require 'base64'

# module with some global definitions...
module Application
  class << self
    def env
      @env ||= AppEnv.new(ENV)
    end

    def redis
      @redis ||=
        Redis.new(
          host: 'test',
          port: 1234,
          db: 1234
        )
    end

    def secrets
      @secrets ||=
        OpenStruct.new YAML.load_file(File.join(Dir.pwd, 'config/secrets.yml'))[ENV['APP_ENV']]
    end
  end

  class AppEnv
    attr_reader :env

    def initialize(env_data)
      @env = env_data
    end

    def in?(variables = [])
      variables.include?(env['APP_ENV'])
    end

    %w[development staging test production].each do |stage|
      define_method "#{stage}?" do
        env['APP_ENV'] == stage
      end
    end
  end
  private_constant :AppEnv

  # Custom loader for project
  module Loader
    FOLDERS ||= %w[app lib].freeze

    class << self
      def load!
        FOLDERS.each(&method(:file_load))
      end

      def file_load(path)
        Dir.glob(File.join(Dir.pwd, path))
          .sort
          .each(&method(:require_all))
      end
    end
  end
end

require 'bundler'
Bundler.require(ENV['APP_ENV'], :default)

require_all 'config/extensions'
Application::Loader.load!
require_relative 'config/router'
