# frozen_string_literal: true

module Policies
  class UserPolicy
    def read
      true # allow reading for all
    end

    def create
      true # allow creation for all
    end

    def update
      user.id == entity.id
    end

    def destroy
      user.id == entity.id ||
        user.role == 'admin'
    end
  end
end