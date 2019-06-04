# frozen_string_literal: true

module Models
  class User < Sequel::Model
    one_to_many :shows
  end
end