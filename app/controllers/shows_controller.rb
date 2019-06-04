# frozen_string_literal: true

module Controllers
  class ShowsController < BaseController
    ##
    # Get list of shows
    #
    get '/' do
      authorize
    end

    ##
    # Get show
    #
    get '/:show_id' do

    end

    ##
    # Create new show
    #
  end
end