# frozen_string_literal: true

module Services
  module Users
    class Authorize
      def initialize(params, headers)
        @params = params

        @header, @payload, @token = headers['Authorization'].to_s.split('.')
      end

      def call
        return Response.for(:bad_token) if [header, payload, token].map(&:to_s).any?(&:empty?)
        return Response.for(:bad_token) if token_incorrect?

        User.find(id: decoded_payload.id)
      end

      private

      attr_reader :header, :payload, :token

      def decoded_payload
        @decoded_payload ||=
          OpenStruct.new Base64.urlsafe_decode64(payload)
      end

      def token_incorrect?
        Digest::SHA2.new(256)
                    .hexdigest(
                      "#{headers}.#{payload}#{Application.secrets.secret}"
                    ) == token
      end
    end
  end
end