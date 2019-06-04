# frozen_string_literal: true

module Policies
  # Simple authorization for CRUD
  class BasePolicy
    def initialize(entity, user)
      @entity = entity
      @user = user
    end

    def can?(action)
      return false unless respond_to?(action)

      send(action)
    end

    protected

    attr_reader :entity, :user
  end
end