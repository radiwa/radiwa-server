# frozen_string_literal: true

module Services
  class Response
    RESPONSE_BY_KEY ||= {
      not_found: {
        code: 404,
        json: '{"status":"error","message":"Integration not found"}',
      },
      success: {
        code: 200,
        json: '{"status":"success"}'
      },
      integration_created: {
        code: 201,
        json: '{"status":"created","id":"%{id}","message":"Integration has been created"}'
      },
      integartion_disabled: {
        code: 200,
        json: '{"status":"success","message":"Integration disabled"}'
      },
      bad_request: {
        code: 400,
        json: '{"status":"bad request","message":"%{field} has wrong value"}'
      },
      already_exists: {
        code: 400,
        json: '{"status":"bad request","message":"%{entity} already exists"}'
      }
    }.freeze

    class << self
      ##
      # Returns response in JSON
      #
      def for(key, attributes = {})
        response = RESPONSE_BY_KEY[key]

        [
          response[:code],
          format(
            response[:json],
            attributes
          )
        ]
      end
    end
  end
end
