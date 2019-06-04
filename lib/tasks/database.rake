# frozen_string_literal: true

namespace :db do
  desc 'Migrate database'
  task :migrate, %i[version] do |_t, args|
    require './config/extensions/sequel'
    Sequel.extension :migration
    version = args[:version].to_i if args[:version]
    Sequel::Migrator.run(DB, 'db/migrations', target: version)
  end
end