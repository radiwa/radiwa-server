# frozen_string_literal: true

module Services
  module Users
    class Create
      def initialize(params)
        data = params.data.transform_keys(&:to_sym).slice(:username, :password)

        @username = data[:username]
        @password = data[:password]
      end

      def call
        return Response.for(:bad_request, field: :username) if username.to_s.empty?
        return Response.for(:bad_request, field: :password) if password.to_s.empty?
        return Response.for(:already_exists, field: :User) if User.find(username: username)

        if user.id
          renderer.render(
            data,
            class: { OpenStruct: Serializers::UsersSerializer })
        else

        end
      end

      private

      attr_reader :username, :password

      def data
        @data ||= OpenStruct.new(
          id: user.id,
          username: username,
          access_token: Jwt.new(user: user).generate
        )
      end

      def user
        @user ||=
          User.create(
            username: username,
            password: BCrypt::Password.create(password)
          )
      end

      def renderer
        @renderer ||=
          JSONAPI::Serializable::Renderer.new
      end
    end
  end
end