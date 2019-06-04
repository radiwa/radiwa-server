# # frozen_string_literal: true
#
# module Controllers
#   class AuthController < BaseController
#     post '/auth' do
#       code, response = Services::Authorization::Jwt.new(osparams).auth
#
#       status code
#       response
#     end
#
#     post '/registration' do
#       code, response =
#         if Services::Users::Create.call(osparams)
#           Services::Authorization::Jwt.new(osparams).generate
#         else
#           Services::Response.for(:bad_request)
#         end
#
#       status code
#       response
#     end
#   end
# end