# frozen_string_literal: true

module Serializers
  class UsersSerializer < JSONAPI::Serializable::Resource
    type 'users'

    id { @object.id }

    attributes :username, :access_token
  end
end