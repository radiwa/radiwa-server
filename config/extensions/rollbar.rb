# frozen_string_literal: true

if Application.env.in?(%w[production])
  # config.access_token = Application.secrets.rollbar_token
end
