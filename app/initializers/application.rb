# frozen_string_literal: true

# module with some global definitions...
module Application
  class << self
    def env
      @env ||= AppEnv.new(ENV)
    end

    def redis
      # init redis
    end
  end

  class AppEnv
    attr_reader :env

    def initialize(env_data)
      @env = env_data
    end

    %w[development staging test production] do |stage|
      define_singleton_method "#{stage}?" do
	env['APP_ENV'] == stage
      end
    end
  end
  private_constant :AppEnv
end
