# frozen_string_literal: true

module Services
  class Jwt
    def initialize(params: {}, user: nil)
      @params = params
      @user = user
    end

    def headers
      Base64.urlsafe_encode64(
        Oj.dump(
          alg: 'HS256', # => SHA256
          typ: 'JWT'
        )
      )
    end

    def payload
      Base64.urlsafe_encode64(
        Oj.dump(
          sub: user.id,
          name: user.username
        )
      )
    end

    def signature
      Digest::SHA2.new(256)
                  .hexdigest(
                    "#{headers}.#{payload}#{Application.secrets.secret}"
                  )
    end

    def generate
      "#{headers}.#{payload}.#{signature}"
    end

    private

    attr_reader :params

    def user
      @user ||=
        User.find(
          username: params.username,
          password: BCrypt::Password.create(params.password)
        )
    end
  end
end