# frozen_string_literal: true

DB = Sequel.connect(
       adapter: 'sqlite',
       database: 'radiwa'
     )