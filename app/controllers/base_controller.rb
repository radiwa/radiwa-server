# frozen_string_literal: true

require 'logger'

module Controllers
  class BaseController < ::Sinatra::Base
    if Application.env.in?(%w[development test])
      set :logger, Logger.new(STDOUT)
    end

    set :show_exceptions, ENV['SINATRA_EXCEPTION'] || false

    def osparams
      @osparams ||=
        OpenStruct.new(params)
    end

    def current_user
      @current_user ||=
        Services::Users::Get.call(request.env['Authorization'])
    end

    def authorize(entity, action)
      Object.const_get("#{entity.class}Policy").new(entity, current_user).can?(action)
    end
  end
end
