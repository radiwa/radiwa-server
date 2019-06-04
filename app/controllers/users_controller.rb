# frozen_string_literal: true

module Controllers
  class UsersController < BaseController
    ##
    # Get list with public users
    #
    get '/' do
      code, response = Services::Users::List.call

      status code
      response
    end

    ##
    # Get information about user
    # == Params
    #
    #  +user_id+ - identifier of user
    #
    get '/:user_id' do
      code, response = Service::Users::Find.call(osparams)

      status code
      response
    end

    ##
    # Creates new user
    # == Params
    #
    #  +username+ - nickname of user
    #  +password+ - password of user
    #
    post '/' do
      code, response = Service::Users::Create.call(osparams)
    end

    ##
    # Update user
    # == Params
    #
    #  +user_id+ - identifier of user
    #  +username+ - nickname of user
    #  +password+ - password of user
    #
    patch '/:user_id' do
      # TODO: ...
    end

    ##
    # Disable user
    # == Params
    #
    #  +user_id+ - identifier of user
    #
    delete '/:user_id' do
      # TODO: ...
    end
  end
end