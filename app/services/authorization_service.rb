# frozen_string_literal: true

module Services
  class AuthorizationService
    def initialize(params)
      @params = params
    end

    def jwt

    end

    private

    attr_reader :params
  end
end