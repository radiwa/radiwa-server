# frozen_string_literal: true

# database connections here...
DB = Sequel.new(**Application.database_config)
